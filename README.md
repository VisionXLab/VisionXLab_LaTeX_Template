# VisionXLab - LaTeX 学术论文模板

专业学术论文模板，适用于 Overleaf 平台和本地编辑。基于高质量论文样式，提供丰富的配置选项和完整示例。

## ✨ 特点

- 📁 **模块化结构** - 章节独立文件，便于管理和协作
- 🖼️ **多 Logo 支持** - 首页支持 3 个 logo，如果需要更多的话要参考[指南](Logo配置指南.md)在[风格参数](academic_template.cls)中修改。
- 🔧 **高度可定制** - 20+ 配置选项，如果需要修改预置风格，则无需修改 .cls 文件
- 📊 **丰富示例** - 图表、算法、公式等完整示例
- ☁️ **Overleaf 就绪** - 可直接上传使用

**详细说明书**：[使用说明](使用说明.md)，建议善用查找功能。

## 📂 项目结构

```
VisionXLab_latex/
├── main.tex                  # 主文件 ⭐
├── academic_template.cls     # PDF 样式文件
├── academic_template_html.tex # arXiv / LaTeXML HTML 兼容层
├── references.bib            # 参考文献
├── sections/                 # 章节文件（独立管理）
└── figures/                  # 图片资源
    ├── logos/               # Logo (PNG)
    └── content/             # 正文图片 (PDF 推荐)
```

## 🚀 快速开始

### Overleaf 使用（推荐）

1. 压缩以下文件为 `.zip`：`main.tex`、`academic_template.cls`、`academic_template_html.tex`、`references.bib`、`sections/`、`figures/`
2. 登录 [Overleaf](https://www.overleaf.com/) → New Project → Upload Project
3. 上传 zip 文件，点击 "Recompile" 编译

### 本地使用

先下载**MikTeX**，并且把它的`bin/x64`添加到Path，建议在vscode中使用扩展LaTeX Workshop。

### arXiv HTML 兼容与预览

主文件必须在 `\documentclass` 后、任何模板配置和作者信息之前，显式加载兼容层：

```latex
\documentclass[]{academic_template}
\input{academic_template_html}
```

已有论文需复制 `academic_template_html.tex`、增加上面的输入，并在 `\maketitle` 后显式输出项目链接：

```latex
\begin{document}
\maketitle
\printprojectlinks
```

该调用在 PDF 中不输出额外内容，原类文件已显示项目链接。HTML 的链接在标题与作者信息之后输出；不要通过 `\AtBeginDocument` 自动插入，线上转换器可能在 `\maketitle` 时才生成标题，导致链接跑到标题上方。

上传 arXiv 和 Overleaf 时也要带上兼容文件。只替换 `.cls` 无法修复 HTML：LaTeXML 找不到自定义类的绑定时会使用通用类，不执行其宏定义。结果是配置命令直接显示在页面上，且 `\affiliation[1]{...}` 被按不带可选参数的语法解析，留下多余的 `[` 和错位的单位。

兼容层只在 LaTeXML 转换时启用：版式配置的参数会被完整消费，作者及其单位对应关系、贡献说明、日期和项目链接会被保留。贡献标记会解析为对应作者的说明。PDF 继续使用原有类文件。HTML 使用适应网页的标准布局，不复制 PDF 的首页 Logo、装饰线和摘要框。

可用 LaTeXML 团队维护的 [ar5ivist](https://github.com/dginev/ar5ivist) 容器预览。先按正常 PDF 编译流程生成最新的 `main.bbl`（`pdflatex → bibtex → pdflatex → pdflatex`）；该容器使用 arXiv 模式，不会自动运行 BibTeX，缺少 `.bbl` 会导致引用缺失。以下命令在模板根目录的 Linux/macOS 或 WSL shell 中执行，需要 Docker：

```bash
docker run -v "$PWD":/docdir -w /docdir \
  --user "$(id -u):$(id -g)" \
  latexml/ar5ivist:2512.17 \
  --source=main.tex --destination=html/main.html
python3 tools/check_html.py html/main.html
```

检查特定内容没有被静默丢弃时，可增加重复的 `--expect "Core Contributors"`、`--expect-link "https://github.com/your-repo"` 和 `--expect-contact "First Author=Your University"` 参数。退出码为 0 表示 HTML 元素与指定元数据检查通过；脚本还会拒绝日志中的致命错误，并报告 `conversion_log_error_count`。完整转换是否成功仍需查看日志，不能只依赖 HTML 中是否有红色命令。

在浏览器中检查 `html/main.html` 和转换日志。该容器使用 arXiv 分支的 LaTeXML 与 ar5iv 的扩展绑定，是同一转换工具链的本地检查；arXiv 线上版本和配置仍可能不同，最终以投稿流程的 HTML 预览为准。[arXiv 官方最佳实践](https://info.arxiv.org/help/submit_latex_best_practices.html)也建议使用受支持的包和标准首页元数据。

## 📝 基本使用

### 修改标题和作者

编辑 [main.tex](main.tex)：

```latex
\title{Your Paper Title}

\author[1,*]{First Author}
\author[1,2]{Second Author}

\affiliation[1]{Your University}
\affiliation[2]{Your Institute}
```

### 添加图片

```latex
\begin{figure}[t]
\centering
\includegraphics[width=0.9\linewidth]{figures/content/your_figure.pdf}
\caption{图片说明}
\label{fig:label}
\end{figure}
```

### 添加表格

```latex
\begin{table}[t]
\centering
\caption{表格标题}
\begin{tabular}{lccc}
\toprule
\textbf{列1} & \textbf{列2} & \textbf{列3} \\
\midrule
数据 & 数据 & 数据 \\
\bottomrule
\end{tabular}
\end{table}
```

### 添加引用

```latex
如文献~\cite{author2024} 所示...
```

## 🎨 配置选项

所有配置命令在 [main.tex](main.tex) 导言区添加（`\documentclass` 之后，`\begin{document}` 之前）。

### 配置速查表

| 配置项 | 命令 | 说明 |
|-------|------|------|
| 主题颜色 | `\setthemecolor{颜色}` | 修改全局颜色 |
| **标题配置** | | |
| 标题字体 | `\settitlefont{\fontsize{19}{22}\selectfont}` | 调整标题字体大小 |
| 标题对齐 | `\titlecenter/\titleleft` | 标题居中/居左 |
| 标题加粗 | `\titleboldon/off` | 标题加粗/不加粗 |
| 标题横线粗度 | `\settitlerulethickness{1pt}` | 同时调整上下横线粗度 |
| 上横线粗度 | `\settoprulethickness{1.5pt}` | 单独调整上横线粗度 |
| 下横线粗度 | `\setbottomrulethickness{0.5pt}` | 单独调整下横线粗度 |
| **Logo 配置** | | |
| Logo 大小 | `\setlogoheight{10mm}` | 调整 logo 高度 |
| Logo 间距 | `\setlogospacing{3mm}` | 调整 logo 间距 |
| Logo 和横线距离 | `\setlogotolineshift{3mm}` | 调整 logo 到标题横线的距离 ⭐ |
| **Abstract 配置** | | |
| Abstract 边框 | `\abstractboxon/off` | 开启/关闭边框 |
| Abstract 背景 | `\setabstractbgcolor{颜色}` | 设置背景颜色 |
| **章节配置** | | |
| Section 字体 | `\setsectionfont{...}` | 调整章节标题字体大小 |
| 章节装饰线 | `\sectionlineon/off` | 开启/关闭装饰线 |
| 装饰线粗度 | `\setsectionlinethickness{2pt}` | 调整章节装饰线粗度 |

### 快速配置示例

```latex
% 红色主题 + 无边框 Abstract
\setthemecolor{C41E3A}
\abstractboxoff
```

```latex
% 大标题 + 居左 + 粗横线
\settitlefont{\fontsize{19}{22}\selectfont}
\titleleft
\settitlerulethickness{1pt}
```

```latex
% 章节装饰线 + 自定义粗度
\sectionlineon
\setsectionlinethickness{2pt}
```

## 📖 完整文档

- **详细使用指南** - [使用说明.md](使用说明.md) - 完整配置说明、配置示例、常见问题
- **配置参考** - [template_config.tex](template_config.tex) - 所有配置选项的代码示例
- **Logo 配置** - [Logo配置指南.md](Logo配置指南.md) - Logo 详细配置和自定义
- **更新日志** - [更新日志.md](更新日志.md) - 版本历史和新功能

## ⚠️ 注意事项

### 图片格式
- **Logo**: PNG 格式，建议 300 DPI，透明背景
- **正文**: PDF 矢量图（推荐），保证缩放不失真

### 编译顺序
```bash
pdflatex → bibtex → pdflatex → pdflatex
```

### 文件命名
- 避免空格和特殊字符
- 使用下划线：`example_figure.pdf` ✅

## 💡 常见问题

**Q: 修改配置后没效果？**
A: 删除 `tmp/` 文件夹中的所有临时文件，然后重新编译。

**Q: Logo 显示不正常？**
A: 检查文件是否在 `figures/logos/` 文件夹中，文件名是否正确（区分大小写），格式是否为 PNG。

**Q: 章节装饰线不显示？**
A: 使用 `\sectionlineon` 后，删除 `tmp/` 文件夹，完全重新编译。

**更多问题？** 查看 [使用说明.md](使用说明.md#常见问题) 中的完整故障排除指南。

## 📧 技术支持

遇到问题？
1. 查看 [使用说明.md](使用说明.md) 中的"常见问题"和"故障排除"部分
2. 参考 [Overleaf 文档](https://www.overleaf.com/learn)
3. 在 [TeX Stack Exchange](https://tex.stackexchange.com/) 搜索解决方案

---

**祝您论文写作顺利！Good luck with your paper! 🎓**
