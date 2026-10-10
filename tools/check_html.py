#!/usr/bin/env python3
"""Check a LaTeXML HTML preview for front-matter conversion failures."""
import argparse
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import sys


class Element:
    def __init__(self, tag='', attrs=()):
        self.tag = tag
        self.attrs = dict(attrs)
        self.children = []

    def text(self):
        return ''.join(c if isinstance(c, str) else c.text() for c in self.children)

    def walk(self):
        yield self
        for child in self.children:
            if isinstance(child, Element):
                yield from child.walk()

    def has_class(self, name):
        return name in self.attrs.get('class', '').split()


class Document(HTMLParser):
    voids = {'area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input',
             'link', 'meta', 'param', 'source', 'track', 'wbr'}

    def __init__(self, html):
        super().__init__(convert_charrefs=True)
        self.root = Element()
        self.stack = [self.root]
        self.feed(html)

    def handle_starttag(self, tag, attrs):
        node = Element(tag, attrs)
        self.stack[-1].children.append(node)
        if tag not in self.voids:
            self.stack.append(node)

    def handle_startendtag(self, tag, attrs):
        self.stack[-1].children.append(Element(tag, attrs))

    def handle_endtag(self, tag):
        for index in range(len(self.stack) - 1, 0, -1):
            if self.stack[index].tag == tag:
                self.stack = self.stack[:index]
                break

    def handle_data(self, text):
        self.stack[-1].children.append(text)


def inspect(path, expected_text=(), expected_links=(), expected_contacts=()):
    nodes = list(Document(Path(path).read_text(encoding='utf-8')).root.walk())
    select = lambda cls: [n for n in nodes if n.has_class(cls)]
    errors = select('ltx_ERROR')
    titles = select('ltx_title_document')
    authors = [n for n in select('ltx_creator') if n.has_class('ltx_role_author')]
    contacts = select('ltx_contact')
    abstracts = select('ltx_abstract')
    failures = []
    log_path = Path(path).with_suffix('.latexml.log')
    log_errors = 0
    if log_path.exists():
        log = log_path.read_text(encoding='utf-8')
        log_errors = len(re.findall(r'^Error:', log, re.MULTILINE))
        if re.search(r'^Fatal:', log, re.MULTILINE):
            failures.append('Fatal conversion error in ' + log_path.name)
    visible_text = ' '.join(n.text() for n in nodes if n.has_class('ltx_document'))
    links = {n.attrs.get('href') for n in nodes if n.tag == 'a'}
    front_nodes = {id(n) for front in titles + authors for n in front.walk()}
    front_end = max((i for i, n in enumerate(nodes) if id(n) in front_nodes), default=-1)
    for text in expected_text:
        if text not in visible_text:
            failures.append('Missing expected text: ' + text)
    for link in expected_links:
        if link not in links:
            failures.append('Missing expected link: ' + link)
        elif any(i < front_end for i, n in enumerate(nodes)
                 if n.tag == 'a' and n.attrs.get('href') == link):
            failures.append('Project link appears before title/author block: ' + link)
    for expected in expected_contacts:
        name, sep, contact = expected.partition('=')
        if not sep:
            raise ValueError('--expect-contact requires Author name=Contact text')
        matched = [author for author in authors if any(
            n.has_class('ltx_personname') and n.text().strip() == name for n in author.walk())]
        if not any(contact in n.text() for author in matched for n in author.walk()
                   if n.has_class('ltx_contact')):
            failures.append('Missing author contact: ' + expected)
    for label, values in [('title', titles), ('authors', authors), ('abstract', abstracts)]:
        if not values or not any(n.text().strip() for n in values):
            failures.append('Missing ' + label)
    if errors:
        failures.append('LaTeXML error elements: ' + ', '.join(n.text().strip() for n in errors))
    broken = [n.text().strip() for n in contacts
              if not n.text().strip() or re.fullmatch(r'(?:Affiliation:\s*)?\[', n.text().strip())]
    if broken:
        failures.append('Empty contacts or orphan affiliation brackets')
    return dict(passed=not failures, failures=failures, title_count=len(titles),
                author_count=len(authors), contact_count=len(contacts),
                abstract_count=len(abstracts), error_count=len(errors),
                conversion_log_error_count=log_errors)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('html', type=Path)
    parser.add_argument('--expect', action='append', default=[], help='Required visible text (repeatable)')
    parser.add_argument('--expect-link', action='append', default=[], help='Required link URL (repeatable)')
    parser.add_argument('--expect-contact', action='append', default=[], help='Author name=Contact text (repeatable)')
    args = parser.parse_args()
    result = inspect(args.html, args.expect, args.expect_link, args.expect_contact)
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    sys.exit(main())
