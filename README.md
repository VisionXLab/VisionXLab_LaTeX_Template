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
├── academic_template.cls     # 样式文件
├── references.bib            # 参考文献
├── sections/                 # 章节文件（独立管理）
└── figures/                  # 图片资源
    ├── logos/               # Logo (PNG)
    └── content/             # 正文图片 (PDF 推荐)
```

## 🚀 快速开始

### Overleaf 使用（推荐）

1. 压缩以下文件为 `.zip`：`main.tex`、`academic_template.cls`、`references.bib`、`sections/`、`figures/`
2. 登录 [Overleaf](https://www.overleaf.com/) → New Project → Upload Project
3. 上传 zip 文件，点击 "Recompile" 编译

### 本地使用

先下载**MikTeX**，并且把它的`bin/x64`添加到Path，建议在vscode中使用扩展LaTeX Workshop。

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
