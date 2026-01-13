# 图片说明 / Figure Instructions

本文件夹用于存放论文中使用的所有图片。

## 文件夹结构

```
figures/
├── logos/           # Logo 图片（PNG 格式）
│   ├── sjtu.png    # 左侧第一个 logo
│   ├── lab.png     # 左侧第二个 logo
│   └── company.png # 右侧公司 logo
└── content/         # 正文图片（PDF 格式，矢量图）
    ├── example_figure.pdf           # 示例全宽图片
    ├── architecture.pdf             # 方法架构图
    ├── sub_figure_a.pdf            # 子图 A
    ├── sub_figure_b.pdf            # 子图 B
    ├── qualitative_comparison.pdf   # 定性比较图
    └── hyperparameter_analysis.pdf  # 超参数分析图
```

## 需要准备的图片列表

### Logo 图片（PNG 格式）
- ✅ **sjtu.png**: 上海交通大学 logo（已准备）
- ✅ **lab.png**: 实验室 logo（已准备）
- ✅ **company.png**: 合作公司 logo（已准备）

### 正文内容图片（PDF 格式，矢量图）

#### Introduction 章节
- ❌ **example_figure.pdf**: 示例图片，展示论文的主要思想或对比效果
  - 建议尺寸：适合双栏宽度
  - 内容：可以是方法概览、对比效果等

#### Method 章节
- ❌ **architecture.pdf**: 方法整体架构图
  - 建议尺寸：适合双栏宽度
  - 内容：展示整个方法的流程和各个组件

- ❌ **sub_figure_a.pdf**: 子图 A，展示方法的某个具体方面
  - 建议尺寸：单栏宽度

- ❌ **sub_figure_b.pdf**: 子图 B，展示方法的另一个具体方面
  - 建议尺寸：单栏宽度

#### Experiments 章节
- ❌ **qualitative_comparison.pdf**: 定性结果对比图
  - 建议尺寸：适合双栏宽度
  - 内容：输入、真实结果、不同方法的输出对比

- ❌ **hyperparameter_analysis.pdf**: 超参数分析图表
  - 建议尺寸：单栏宽度
  - 内容：展示不同超参数设置下的性能变化

## 图片制作建议

### 矢量图（PDF 格式）
正文中的所有图片建议使用 PDF 格式的矢量图，这样可以确保：
- 缩放不失真
- 打印质量高
- 文件大小较小

可以使用以下工具制作：
- **Python**: Matplotlib, Seaborn (使用 `plt.savefig('figure.pdf')`)
- **专业软件**: Adobe Illustrator, Inkscape
- **在线工具**: draw.io (导出为 PDF)

### Logo（PNG 格式）
Logo 使用 PNG 格式即可，建议：
- 分辨率：300 DPI 或更高
- 背景：透明背景
- 尺寸：高度建议 8-10mm（约 300px）

## 临时占位符

如果暂时没有准备好正式图片，可以：
1. 从参考论文的 `figures/` 文件夹复制示例图片作为占位符
2. 使用以下 Python 脚本生成简单的占位符图片：

```python
import matplotlib.pyplot as plt
import numpy as np

# 创建简单的占位符图片
fig, ax = plt.subplots(figsize=(10, 6))
ax.text(0.5, 0.5, 'Placeholder Figure',
        ha='center', va='center', fontsize=24)
ax.set_xlim(0, 1)
ax.set_ylim(0, 1)
ax.axis('off')
plt.tight_layout()
plt.savefig('placeholder.pdf', bbox_inches='tight')
plt.close()
```

## 更新说明

准备好图片后，将对应的 PDF 文件放入 `figures/content/` 文件夹，并确保文件名与上述列表一致。LaTeX 编译时会自动引用这些图片。
