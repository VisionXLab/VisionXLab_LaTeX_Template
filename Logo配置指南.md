# Logo 配置详细指南

## 你需要在根目录下的[template](academic_template.cls)修改以下内容。

## 📖 目录
1. [使用自定义文件名的 Logo](#1-使用自定义文件名的-logo)
2. [调整 Logo 数量（1-5个）](#2-调整-logo-数量)
3. [Logo 位置调整](#3-logo-位置调整)
4. [Logo 大小和间距](#4-logo-大小和间距)
5. [常见问题](#5-常见问题)

---

## 1. 使用自定义文件名的 Logo

### 默认配置
模板默认使用以下文件名：
- `figures/logos/sjtu_long.png` - 左侧第一个
- `figures/logos/rethinklab.png` - 左侧第二个
- `figures/logos/lab.png` - 左侧第三个
- `figures/logos/company.png` - 右侧

### 方法 A：修改文件名（推荐）
直接将您的 logo 文件重命名为默认名称即可，无需修改代码。

### 方法 B：修改代码中的文件名
如果想使用自己的文件名（如 `mylogo.png`, `partner.png` 等），需要修改 `academic_template.cls` 文件。

**步骤：**

1. 打开 `academic_template.cls` 文件
2. 找到第 222-237 行的 `\fancypagestyle{firststyle}` 部分
3. 修改文件路径：

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{-\height}[0pt][0pt]{%
            % 修改这里的文件名 ↓
            \includegraphics[height=\logoheight]{figures/logos/mylogo.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            % 修改这里的文件名 ↓
            \includegraphics[height=\logoheight]{figures/logos/partner.png}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{-\height}[0pt][0pt]{%
            % 修改这里的文件名 ↓
            \includegraphics[height=\logoheight]{figures/logos/sponsor.png}%
        }%
    }
}
```

**示例：**

```latex
% 使用文件: university.png, lab.png, company.png
\includegraphics[height=\logoheight]{figures/logos/university.png}
\includegraphics[height=\logoheight]{figures/logos/lab.png}
\includegraphics[height=\logoheight]{figures/logos/company.png}
```

---

## 2. 调整 Logo 数量

### 情况 1：只显示 1 个 Logo（左侧）

修改 `academic_template.cls` 第 222-237 行：

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
        }%
    }
    \fancyhead[R]{}  % 右侧留空
}
```

### 情况 2：显示 2 个 Logo（左1右1）

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/company.png}%
        }%
    }
}
```

### 情况 3：显示 3 个 Logo（默认，左2右1）

这是默认配置，已经设置好了。

### 情况 4：显示 4 个 Logo（左2右2）

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/lab.png}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/company.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/partner.png}%
        }%
    }
}
```

### 情况 5：显示 5 个 Logo（左3右2）

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/logo1.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/logo2.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/logo3.png}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/logo4.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/logo5.png}%
        }%
    }
}
```

### 情况 6：居中显示 Logo

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{}  % 左侧留空
    \fancyhead[C]{%  % 居中显示
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/lab.png}%
        }%
    }
    \fancyhead[R]{}  % 右侧留空
}
```

---

## 3. Logo 位置调整

### Logo 和标题横线的距离 ⭐

Logo 和标题横线之间的距离可以通过调整 logo 在页眉区域内的垂直位置来控制。

**优雅方案：使用 `\setlogotolineshift{}` 命令（推荐）**

这个方案的优势：
- ✅ **不影响正文布局**：页眉区域高度固定，正文位置不变
- ✅ **只调整 logo 位置**：在页眉区域内微调 logo 的垂直位置
- ✅ **更加直观**：正值增大距离，负值减小距离

在 `main.tex` 导言区添加：

```latex
\documentclass[]{academic_template}

% 调整 logo 在页眉区域的垂直位置（默认 0mm）
\setlogotolineshift{0mm}    % 默认位置
\setlogotolineshift{3mm}    % logo 向上移 3mm，增大与横线的距离
\setlogotolineshift{5mm}    % logo 向上移 5mm，距离更大
\setlogotolineshift{-3mm}   % logo 向下移 3mm，减小与横线的距离

\begin{document}
...
```

**效果：**
- `5mm` - logo 和横线距离很大
- `3mm` - 距离较大
- `0mm` - 默认距离
- `-3mm` - 距离较小
- `-5mm` - 距离很小

**工作原理：**
```
┌─────────────────────────────────┐
│  页眉区域（高度固定 35pt）        │
│                                 │
│  ↑ logo 向上移动（正值）         │
│  [Logo]  ← 默认：停靠在底部      │
│  ↓ logo 向下移动（负值）         │
├─────────────────────────────────┤ ← 标题横线（位置固定）
│  标题区域                        │
│                                 │
│  正文内容（位置不受影响）         │
└─────────────────────────────────┘
```

**注意事项：**
- 如果 `headheight` 太小，LaTeX 会警告
- 如果 `headheight` 太大，会压缩正文空间
- 建议值：30pt - 45pt 之间

---

### 垂直位置（微调）
Logo 已经设置为向下停靠（`\raisebox{-\height}[0pt][0pt]`），无需调整。

如果需要微调垂直位置：

```latex
% 向上移动 2mm
\raisebox{-\height+2mm}[0pt][0pt]{%
    \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
}%

% 向下移动 2mm
\raisebox{-\height-2mm}[0pt][0pt]{%
    \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
}%
```

### 水平位置
使用 `\hspace{}` 调整间距：

```latex
% logo 之间的间距
\hspace{3mm}    % 默认
\hspace{5mm}    % 较大
\hspace{1mm}    % 较小
```

---

## 4. Logo 大小和间距

### 在 main.tex 中全局调整（推荐）

在 `main.tex` 导言区添加：

```latex
% 设置所有 logo 的高度
\setlogoheight{10mm}   % 默认
\setlogoheight{8mm}    % 较小
\setlogoheight{12mm}   % 较大

% 设置 logo 之间的间距
\setlogospacing{3mm}   % 默认
\setlogospacing{5mm}   % 较大
```

### 在 .cls 中单独调整每个 logo

如果想让某个 logo 特别大或特别小：

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        % 第一个 logo 高度 12mm
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=12mm]{figures/logos/sjtu.png}%
        }%
        \hspace{3mm}%
        % 第二个 logo 高度 8mm
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=8mm]{figures/logos/lab.png}%
        }%
    }
    \fancyhead[R]{%
        % 右侧 logo 高度 10mm
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=10mm]{figures/logos/company.png}%
        }%
    }
}
```

---

## 5. 常见问题

### Q1: 如何添加第 4 个 logo？

**A:** 在 `academic_template.cls` 的 `\fancypagestyle{firststyle}` 中添加：

```latex
\fancyhead[R]{%
    \raisebox{-\height}[0pt][0pt]{%
        \includegraphics[height=\logoheight]{figures/logos/logo3.png}%
    }%
    \hspace{\logospacing}%
    \raisebox{-\height}[0pt][0pt]{%
        \includegraphics[height=\logoheight]{figures/logos/logo4.png}%
    }%
}
```

### Q2: Logo 文件可以放在其他位置吗？

**A:** 可以，修改路径即可：

```latex
% 放在根目录
\includegraphics[height=\logoheight]{mylogo.png}

% 放在 images 文件夹
\includegraphics[height=\logoheight]{images/logo.png}

% 使用绝对路径（不推荐）
\includegraphics[height=\logoheight]{/path/to/logo.png}
```

### Q3: 可以使用 JPG 或 PDF 格式的 logo 吗？

**A:** 可以，但建议使用 PNG：

```latex
% PNG (推荐，支持透明)
\includegraphics[height=\logoheight]{figures/logos/logo.png}

% JPG (支持，但无透明背景)
\includegraphics[height=\logoheight]{figures/logos/logo.jpg}

% PDF (支持，矢量图)
\includegraphics[height=\logoheight]{figures/logos/logo.pdf}
```

### Q4: Logo 太大，超出页面怎么办？

**A:** 减小 logo 高度或减少 logo 数量：

```latex
% 方法 1: 减小高度
\setlogoheight{6mm}

% 方法 2: 减小间距
\setlogospacing{2mm}

% 方法 3: 只显示重要的 logo，删除其他的
```

### Q5: 如何让 logo 居中显示？

**A:** 修改 `\fancypagestyle{firststyle}`：

```latex
\fancypagestyle{firststyle}{
    \fancyhead[C]{%  % 改为 C (center)
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/sjtu.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/lab.png}%
        }%
    }
    \fancyhead[L]{}  % 左侧留空
    \fancyhead[R]{}  % 右侧留空
}
```

---

## 📌 完整示例

### 示例 1: 使用 4 个自定义 logo

**文件结构：**
```
figures/logos/
├── university.png
├── department.png
├── lab.png
└── funding.png
```

**修改 academic_template.cls:**

```latex
\fancypagestyle{firststyle}{
    \fancyhead[L]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/university.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/department.png}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/lab.png}%
        }%
        \hspace{\logospacing}%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=\logoheight]{figures/logos/funding.png}%
        }%
    }
}
```

**在 main.tex 中调整大小：**

```latex
\documentclass[]{academic_template}

% Logo 配置
\setlogoheight{9mm}
\setlogospacing{4mm}

\begin{document}
...
```

---

### 示例 2: 只显示 1 个大 logo（居中）

**修改 academic_template.cls:**

```latex
\fancypagestyle{firststyle}{
    \fancyhead[C]{%
        \raisebox{-\height}[0pt][0pt]{%
            \includegraphics[height=15mm]{figures/logos/main_logo.png}%
        }%
    }
    \fancyhead[L]{}
    \fancyhead[R]{}
}
```

---

## 💡 提示

1. **修改后重新编译**：修改 `.cls` 文件后，需要删除 `tmp/` 文件夹中的所有临时文件，然后完全重新编译

2. **备份原文件**：修改 `.cls` 文件前，建议先备份一份

3. **文件命名**：logo 文件名避免使用空格和特殊字符，推荐使用下划线：`my_logo.png` ✅ 而不是 `my logo.png` ❌

4. **透明背景**：建议使用透明背景的 PNG 文件，这样 logo 在白色页面上显示效果更好

5. **分辨率**：建议使用 300 DPI 或更高分辨率的图片，确保打印质量

---

**如有其他问题，请参考 [使用说明.md](使用说明.md) 或提出 Issue。**
