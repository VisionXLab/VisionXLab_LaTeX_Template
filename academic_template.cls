
%%======== Package options and base class ========

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academic_template}[2024/01/12 VisionXLab Academic Template]
\LoadClassWithOptions{article}
\pdfoutput=1

% Layout
\RequirePackage[top=2.75cm, bottom=2.5cm, left=2.5cm, right=2.5cm, columnsep=0.65cm, headheight=35pt]{geometry}
\RequirePackage{microtype}
\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage[latin, english]{babel}
\RequirePackage{lipsum}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{ulem}  % 引用下划线
\DisableLigatures[f]{family=sf*}
\RequirePackage{graphicx}
\RequirePackage{subcaption}

\RequirePackage{booktabs}
\RequirePackage{nicematrix}
\RequirePackage{multirow}
\RequirePackage{bm}
\newcommand{\nm}[1]{#1}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 可配置的主题颜色 - 默认蓝色
% 用户可以在 main.tex 中通过 \setthemecolor{颜色代码} 修改
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{themecolor}{HTML}{2E5AA8}
\definecolor{themeblue}{HTML}{2E5AA8}

% 设置主题颜色的命令（在 main.tex 中使用）
\newcommand{\setthemecolor}[1]{%
  \definecolor{themecolor}{HTML}{#1}%
  \definecolor{themeblue}{HTML}{#1}%
}

\newcommand{\themeblue}[1]{{\bfseries\color{themecolor} #1}}

% References %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=themeblue,
  citecolor=themeblue,
  urlcolor=themeblue
}



\RequirePackage[numbers, sort&compress]{natbib}
\def\bibfont{\small}

%%========  Bibliography using bibtex ========
\addto{\captionsenglish}{\renewcommand{\refname}{References}}
\newcommand{\citeas}[1]{\Needspace*{8\baselineskip}\noindent\bibentry{#1}}



% Section and caption format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 可配置的章节标题样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 默认字体大小
\newcommand{\sectionfont}{\fontsize{12}{14}\selectfont}
\newcommand{\subsectionfont}{\fontsize{11}{13}\selectfont}
\newcommand{\subsubsectionfont}{\fontsize{10}{12}\selectfont}

% 标题样式配置命令
\newcommand{\setsectionfont}[1]{\renewcommand{\sectionfont}{#1}}
\newcommand{\setsubsectionfont}[1]{\renewcommand{\subsectionfont}{#1}}

% 是否在小节标题下方添加装饰线（默认关闭）
\newif\if@sectionline
\@sectionlinefalse

% 装饰线颜色（默认使用主题颜色）
\newcommand{\sectionlinecolor}{themecolor}
\newcommand{\setsectionlinecolor}[1]{\renewcommand{\sectionlinecolor}{#1}}

% 装饰线粗度配置（默认 1.5pt）
\newlength{\sectionlinethickness}
\setlength{\sectionlinethickness}{1.5pt}
\newcommand{\setsectionlinethickness}[1]{\setlength{\sectionlinethickness}{#1}}

\RequirePackage{titlesec}

% 段落格式
\titleformat*{\paragraph}{\itshape}

% 定义两种 Section 格式
% 格式 1: 无装饰线（默认）
\newcommand{\sectionformatnoline}{%
  \titleformat*{\section}{\sectionfont\sffamily\bfseries\color{themecolor}}%
}

% 格式 2: 有装饰线
\newcommand{\sectionformatwithline}{%
  \titleformat{\section}
    {\sectionfont\sffamily\bfseries\color{themecolor}}
    {\thesection}{1em}{}
    [\vspace{2pt}{\color{\sectionlinecolor}\titlerule[\sectionlinethickness]}]%
}

% 初始化：使用无装饰线格式
\sectionformatnoline

% 开启/关闭小节装饰线的命令
\newcommand{\sectionlineon}{%
  \@sectionlinetrue%
  \sectionformatwithline%
}
\newcommand{\sectionlineoff}{%
  \@sectionlinefalse%
  \sectionformatnoline%
}

% Subsection 格式
\titleformat*{\subsection}{\subsectionfont\sffamily\bfseries\color{themecolor}}

% Subsubsection 格式
\titleformat*{\subsubsection}{\subsubsectionfont\sffamily\bfseries\color{themecolor}}


\newcommand{\bffont}
{\fontsize{8.8}{10}\selectfont}

\DeclareTextFontCommand{\textbf}{\bffont\bfseries\sffamily}



\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{}
\DeclareCaptionFormat{custom}{{\sffamily\textbf{#1 #2}} #3}
\captionsetup{singlelinecheck=true,format=custom,labelsep=custom,font=small}
\captionsetup[sub]{singlelinecheck=true,format=custom,labelsep=custom,font=small}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Authors, affiliations, infos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand{\authorfont}
{\fontsize{12}{14}\selectfont}

\newcommand\authorlist{}
\newcommand\authorformat[2][]{\authorfont {\sffamily\mbox{#2$^{#1}$}}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{,\allowbreak\ }}

\newcommand{\affiliationfont}
{\fontsize{10}{12}\selectfont}

\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{{\affiliationfont {\sffamily\mbox{$^{#1}$#2}}}}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{,\allowbreak\ }}

\newcommand{\contributionfont}
{\fontsize{10}{12}\selectfont}

\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{{\contributionfont\mbox{$^{#1}$#2}}}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{,\allowbreak\ }}

\newcommand{\checkdatafont}
{\fontsize{7.92}{10}\selectfont}

\newcommand\checkdatalist{}
\newcommand\checkdataformat[2][]{{\small {\checkdatafont\sffamily \bfseries #1:} #2}}
\newcommand\checkdata[2][]{\addtolist[#1]{#2}{\checkdatalist}{\checkdataformat}{\par}}


\newcommand{\abstractinfont}
{\fontsize{10}{12}\selectfont}

\renewcommand{\abstract}[1]{\def\abstractlist{{\abstractinfont #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

\renewcommand\date[1]{\checkdata[Date]{#1}}
\newcommand\correspondence[1]{\checkdata[Correspondence]{#1}}


\newcommand{\titlefont}
{\fontsize{17}{20}\selectfont}

% 标题字体大小配置
\newcommand{\settitlefont}[1]{\renewcommand{\titlefont}{#1}}

% 标题对齐方式（居中/居左可选）
\newif\if@titlecenter
\@titlecentertrue

\newcommand{\titlecenter}{\@titlecentertrue}
\newcommand{\titleleft}{\@titlecenterfalse}

% 标题加粗配置（默认加粗）
\newif\if@titlebold
\@titleboldtrue

\newcommand{\titleboldon}{\@titleboldtrue}
\newcommand{\titleboldoff}{\@titleboldfalse}

\renewcommand{\title}[1]{%
  \newcommand{\titlelist}{%
    \titlefont{%
      \sffamily%
      \if@titlebold\bfseries\fi%
      #1%
    }%
  }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract 风格配置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Abstract 标题字体
\newcommand{\abstractfont}{\fontsize{10}{12}\selectfont}
\newcommand{\setabstractfont}[1]{\renewcommand{\abstractfont}{#1}}

% Abstract 框样式（默认：有边框）
\newif\if@abstractbox
\@abstractboxtrue

% 开启/关闭 Abstract 边框
\newcommand{\abstractboxon}{\@abstractboxtrue}
\newcommand{\abstractboxoff}{\@abstractboxfalse}

% Abstract 框颜色配置
\newcommand{\abstractframecolor}{themecolor}
\newcommand{\setabstractframecolor}[1]{\renewcommand{\abstractframecolor}{#1}}

% Abstract 背景颜色（默认白色）
\newcommand{\abstractbgcolor}{white}
\newcommand{\setabstractbgcolor}[1]{\renewcommand{\abstractbgcolor}{#1}}

% Abstract 标题（居中/居左可选）
\newif\if@abstractcenter
\@abstractcentertrue

\newcommand{\abstracttitlecenter}{\@abstractcentertrue}
\newcommand{\abstracttitleleft}{\@abstractcenterfalse}

% Abstract 标题内容
\newcommand{\beginabstract}{%
  % 标题居中/居左控制（只影响标题，不影响正文）
  \if@abstractcenter
    {\centering\abstractfont{\sffamily\bfseries\color{themecolor}Abstract}\par}%
  \else
    \abstractfont{\sffamily\bfseries\color{themecolor}Abstract}\par
  \fi
  \vskip 3mm
}

\newcommand{\beginappendix}{%
  \appendix%
  \section*{{\titlefont\sffamily\themeblue{Appendix}}}%
  \addcontentsline{toc}{section}{Appendix}%
  \setcounter{section}{1}% Set to 1 so subsections will be A.1, A.2, etc.
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}%
}


\usepackage[subfigure]{tocloft}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % 目录后一行连续的点
\renewcommand{\cftsecfont}{\sffamily}
\renewcommand{\cftsecpagefont}{\sffamily}{\color{themecolor}}
\renewcommand{\cfttoctitlefont}
{\sffamily\sectionfont\themeblue}


%%======== Header and Footer Content ========
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logo 配置 - 支持三个 logo
% Logo 向下停靠到页眉底部（标题横线上方）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Logo 高度配置（可在 main.tex 中修改）
\newlength{\logoheight}
\setlength{\logoheight}{10mm}
\newcommand{\setlogoheight}[1]{\setlength{\logoheight}{#1}}

% Logo 间距配置
\newlength{\logospacing}
\setlength{\logospacing}{3mm}
\newcommand{\setlogospacing}[1]{\setlength{\logospacing}{#1}}

% Logo 垂直位置微调（默认 0mm）
% 正值：logo 向上移动，增大与横线的距离
% 负值：logo 向下移动，减小与横线的距离
\newlength{\logoverticalshift}
\setlength{\logoverticalshift}{0mm}
\newcommand{\setlogotolineshift}[1]{\setlength{\logoverticalshift}{#1}}

% SJTU Logo 样式配置（默认使用 long 版本）
\newif\if@sjtublue
\@sjtubluefalse
\newcommand{\setsjtublue}{\@sjtubluetrue}

\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{\dimexpr-\height+\logoverticalshift\relax}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/rethinklab.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{\dimexpr-\height+\logoverticalshift\relax}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/lab.png}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{\dimexpr-\height+\logoverticalshift\relax}[0pt][0pt]{%
            \if@sjtublue
                \includegraphics[height=\logoheight]{figures/logos/sjtu_blue.png}%
            \else
                \includegraphics[height=\logoheight]{figures/logos/sjtu_long.png}%
            \fi
        }%
    }
}

%去除页眉页脚横线
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}



% rules for title box at top of first page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 标题横线粗度配置
% 上横线粗度（默认 0.5pt）
\newlength{\toprulethickness}
\setlength{\toprulethickness}{0.5pt}
\newcommand{\settoprulethickness}[1]{\setlength{\toprulethickness}{#1}}

% 下横线粗度（默认 0.5pt）
\newlength{\bottomrulethickness}
\setlength{\bottomrulethickness}{0.5pt}
\newcommand{\setbottomrulethickness}[1]{\setlength{\bottomrulethickness}{#1}}

% 同时设置上下横线粗度（兼容旧命令）
\newcommand{\settitlerulethickness}[1]{%
  \setlength{\toprulethickness}{#1}%
  \setlength{\bottomrulethickness}{#1}%
}

%此处为标题两侧线段
\newcommand{\@toptitlebar}{
  {\color{themecolor}\hrule height \toprulethickness}
  \vskip 6mm
}
\newcommand{\@bottomtitlebar}{
  \vskip 6mm
  {\color{themecolor}\hrule height \bottomrulethickness}
}


% Titlebox %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\mymaketitle}{%
  % 标题框线设置
  \tcbset{enhanced}
  \tcbset{left=8mm}
  \tcbset{right=8mm}
  \tcbset{top=6mm}
  \tcbset{bottom=6mm}
  \tcbset{colback=white}
  \tcbset{colframe=themecolor}
  \tcbset{boxrule=0.5pt}
  \tcbset{before skip=0pt}
  \tcbset{grow to left by=1.5pt}
  \tcbset{grow to right by=1.5pt}
  \tcbset{arc=2.5mm}
      {
      \setlength{\parskip}{0mm}
      \centering
      \nohyphens

      {
      \@toptitlebar

      % 标题对齐方式控制
      \if@titlecenter
        {\centering\titlelist\par}%
      \else
        \titlelist\par
      \fi
         \@bottomtitlebar
      }
      \vskip 6mm
      \authorlist
      \vskip 3mm
      %
      \affiliationlist\par
      \vskip 3mm
      %
      \contributionlist\par
    }
   \vskip 6mm

  % Abstract 框 - 根据配置选择是否显示边框
  \if@abstractbox
    % 有边框的 Abstract
    \begin{tcolorbox}[
      colback=\abstractbgcolor,
      colframe=\abstractframecolor,
      boxrule=0.5pt,
      arc=2.5mm,
      left=8mm,
      right=8mm,
      top=6mm,
      bottom=6mm
    ]
      \setlength{\parindent}{0cm}
      \setlength{\parskip}{0cm}

      \beginabstract

      \abstractlist\par
      %
      \vskip 3mm
      %
      {
        \setlength{\parskip}{0cm}
        \ifdefempty{\checkdatalist}{\vspace*{0.65cm}}{\checkdatalist\par}
      }
    \end{tcolorbox}
  \else
    % 无边框的 Abstract
    {
      \setlength{\parindent}{0cm}
      \setlength{\parskip}{0cm}

      \beginabstract

      \abstractlist\par
      %
      \vskip 3mm
      %
      {
        \setlength{\parskip}{0cm}
        \ifdefempty{\checkdatalist}{\vspace*{0.65cm}}{\checkdatalist\par}
      }
    }
  \fi

  \tcbset{reset}
  \FloatBarrier

  %加入页眉页脚
  \thispagestyle{firststyle}

}


\if@twocolumn%
\renewcommand{\maketitle}{
\twocolumn[%
  \vskip 3mm
  \mymaketitle
  \vskip 8mm
]
}%
\else%
\renewcommand{\maketitle}{
  \mymaketitle
  \vskip 8mm
}%
\fi
