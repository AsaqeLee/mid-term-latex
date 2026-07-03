# 西安电子科技大学硕士学位论文中期考核报告表（学术学位）LaTeX 模板

这是一个基于学校原始 PDF 模板制作的可填写 LaTeX 版本。项目不重新手绘表格，
而是以原始 PDF 作为固定底图，再通过 LaTeX 在指定位置叠加填写内容，从而尽量保留
Word/PDF 模板中的页面尺寸、字体、字距、框线和版式位置。

## 特性

- 保留原始 6 页 A4 模板版式。
- 支持填写封面信息、正文内容、导师评价、考核评语、签名和日期。
- 正文区域使用固定框策略：内容只在原模板框内排版，不改变框线、不撑开页面。
- `info.tex` 全部留空时，生成结果与原始空白模板保持一致。
- 保留 `\printtemplate`，可直接输出纯空白模板。

## 快速开始

```bash
xelatex main.tex
```

编译产物为 `main.pdf`。

建议修改 `info.tex` 后重新编译两次：

```bash
xelatex main.tex
xelatex main.tex
```

## 填写方式

只需要编辑 `info.tex`。取消字段前的注释并填入内容即可。

```tex
\renewcommand{\XueHao}{2023123456}
\renewcommand{\XingMing}{张三}
\renewcommand{\LunWenTiMu}{基于深度学习的目标检测方法研究}

\renewcommand{\YanJiuMuBiao}{%
本研究面向若干实际应用场景，围绕关键问题开展理论分析、算法设计与实验验证。
}
```

不要直接修改原始 PDF 模板文件。它是底图来源，文件名需要保持不变。

## 字段清单

封面字段：

```tex
\XueHao
\XingMing
\YiJiXueKe
\ErJiXueKe
\ZhiDaoJiaoShi
\XueYuan
\BaoGaoRiQi
\LunWenTiMu
```

正文内容字段：

```tex
\XuanTiLaiYuan
\YanJiuMuBiao
\YiWanChengGongZuo
\BuXiangFuShuoMing
\XiaYiBuJiHua
\XueShuChengGuo
```

第 6 页评价、签名和日期字段：

```tex
\DaoShiPingJia
\DaoShiQianMing
\DaoShiNian
\DaoShiYue
\DaoShiRi
\ZhongQiPingYu
\ZuZhangQianMing
\ChengYuanQianMing
\KaoHeNian
\KaoHeYue
\KaoHeRi
```

## 固定框策略

本模板的表格框线来自原始 PDF，不会随内容变化。正文会被限制在对应填写区域内：

- 内容较短时，框线和页面布局保持原样。
- 内容较长时，超出固定区域的部分会被裁掉。
- 如需填写长段落，应主动压缩文字，或自行拆分到学校允许的附页/补充材料中。

这种策略的目标是避免“内容越多，模板越不像原件”的问题。

## 纯空白模板

默认 `main.tex` 输出可填写版本：

```tex
\printmidterm
```

如果只想输出原始空白模板，可改为：

```tex
\printtemplate
```

## 文件结构

```text
.
├── README.md
├── info.tex
├── main.tex
├── xidian-midterm.cls
└── 西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf
```

关键文件说明：

- `main.tex`：编译入口。
- `info.tex`：填写内容入口，推荐只改这个文件。
- `xidian-midterm.cls`：模板类文件，负责加载 PDF 底图和叠加内容。
- `西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf`：权威模板底图。

## 依赖

需要使用 XeLaTeX 编译。模板依赖常见 TeX Live 宏包：

```text
ctex
pdfpages
tikz
```

macOS 上推荐安装 MacTeX；Linux/Windows 上推荐安装完整 TeX Live。

## 注意事项

- 本模板以当前仓库内的 PDF 为权威底图。如果学校更新模板，应替换该 PDF 并重新校准覆盖坐标。
- 不建议手工重画表格。Word 导出的 PDF 在字体、字距、行高和边框上存在细节差异，手绘方案很难稳定复刻。
- 当前版本不提供自动续页。固定框内的内容需要使用者自行控制长度。
