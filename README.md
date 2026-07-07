# 西安电子科技大学硕士学位论文中期考核报告表 LaTeX 模板

这是一个面向“西安电子科技大学硕士学位论文中期考核报告表（学术学位）”的 LaTeX 模板。项目保留学校原始 PDF 作为权威底图，并提供类似 `xduts` 的键值接口填写封面、正文、导师评价、考核评语、签名和日期。

## 特性

- 默认 `\printmidterm` 输出可填写版本：封面、填表说明和评审页沿用原始 PDF，正文使用可分页 LaTeX 表框。
- 正文页数由内容决定：短内容不会被硬性塞成 6 页，长内容会自动续页，不再裁掉正文。
- 动态正文页保持固定大小表框，每页都有完整的上下框线。
- 首页填写内容默认使用三号字，匹配首页模板字号。
- 保留 `\printfixedmidterm`，用于需要严格覆盖原始 6 页 PDF 的场景。
- 保留 `\printtemplate`，可直接输出学校原始空白模板。
- 继续兼容旧版 `\renewcommand` 字段接口。

## 快速开始

```bash
xelatex main.tex
xelatex main.tex
```

编译产物为 `main.pdf`。

如果本机安装了 `l3build`，也可以使用：

```bash
l3build doc
```

## 填写方式

推荐只编辑 `info.tex`，使用 `\midtermsetup` 填写内容：

```tex
\midtermsetup{
  info = {
    student-id = {2023123456},
    name = {张三},
    first-level-discipline = {电子科学与技术},
    second-level-discipline = {电路与系统},
    supervisor = {李四 教授},
    school = {电子工程学院},
    report-date = {2026年7月},
    title = {基于深度学习的目标检测方法研究}
  },
  content = {
    source = {导师科研项目},
    research-goal = {
      本研究面向若干实际应用场景，围绕关键问题开展理论分析、
      算法设计与实验验证。
    },
    completed-work = {
      目前已完成相关文献调研、基础模型复现和初步实验分析。
    },
    deviation = {
      目前研究内容与开题报告基本一致。
    },
    next-plan = {
      后续将继续完善实验方案，补充对比实验，并完成论文主要章节撰写。
    },
    achievements = {暂无。}
  },
  review = {
    supervisor-comment = {
      该生按计划推进课题研究，已完成阶段性工作，同意进入下一阶段。
    },
    supervisor-sign = {李四},
    supervisor-year = {2026},
    supervisor-month = {7},
    supervisor-day = {3},
    committee-comment = {
      中期考核通过，建议根据专家意见继续完善研究内容和论文写作。
    },
    chair-sign = {王五},
    member-sign = {赵六、钱七},
    committee-year = {2026},
    committee-month = {7},
    committee-day = {3}
  }
}
```

如果正文中需要英文逗号 `,`，建议把整段内容放在 `{...}` 中，避免被键值解析器当作分隔符。

## 键值接口

### `info`

封面信息：

| 键 | 含义 |
| --- | --- |
| `student-id` | 学号 |
| `name` | 姓名 |
| `first-level-discipline` | 一级学科 |
| `second-level-discipline` | 二级学科 |
| `supervisor` | 指导教师 |
| `school` | 学院 |
| `report-date` | 报告日期 |
| `title` | 论文题目 |

### `content`

正文内容：

| 键 | 对应区域 |
| --- | --- |
| `source` | 选题来源 |
| `research-goal` | 一、学位论文研究目标及研究内容 |
| `completed-work` | 二、目前已完成学位论文工作的内容 |
| `deviation` | 三、现阶段完成的工作与开题报告内容不相符的情况说明 |
| `next-plan` | 四、下一步工作计划及需要完成的研究内容和需要解决的关键技术 |
| `achievements` | 五、已发表的与学位论文相关的学术论文、其他研究成果以及拟发表的研究成果 |

### `review`

评审页内容：

| 键 | 含义 |
| --- | --- |
| `supervisor-comment` | 指导教师评价意见 |
| `supervisor-sign` | 指导教师签名 |
| `supervisor-year` | 指导教师签名年份 |
| `supervisor-month` | 指导教师签名月份 |
| `supervisor-day` | 指导教师签名日期 |
| `committee-comment` | 中期总结报告评语及结论 |
| `chair-sign` | 组长签名 |
| `member-sign` | 成员签名 |
| `committee-year` | 考核结论年份 |
| `committee-month` | 考核结论月份 |
| `committee-day` | 考核结论日期 |

### `style`

一般不需要修改。仅在更换底图或微调字体时使用：

| 键 | 含义 |
| --- | --- |
| `template-file` | 原始 PDF 模板路径 |
| `cover-field-font` | 首页填写字段字体命令，默认三号 |
| `field-font` | 非首页签名和日期字段字体命令 |
| `body-font` | 正文字体命令 |
| `small-font` | 评审页评语字体命令 |

示例：

```tex
\midtermsetup{
  style = {
    template-file = {西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf}
  }
}
```

## 输出模式

默认 `main.tex` 输出动态可填写版本：

```tex
\printmidterm
```

如需输出学校原始空白模板：

```tex
\printtemplate
```

如需严格复刻原始 6 页 PDF，并把内容覆盖到固定区域：

```tex
\printfixedmidterm
```

`printfixedmidterm` 是兼容模式。它会保持原始 6 页版式，但正文超出固定区域时仍可能被裁切；长正文应使用默认的 `\printmidterm`。

## 兼容旧接口

旧版 `\renewcommand` 写法仍然可用，例如：

```tex
\renewcommand{\XueHao}{2023123456}
\renewcommand{\XingMing}{张三}
```

新文档建议使用 `\midtermsetup`，旧接口仅作为兼容层保留。

## 文件结构

```text
.
├── README.md
├── build.lua
├── info.tex
├── main.tex
├── xidian-midterm.cls
└── 西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf
```

关键文件说明：

- `main.tex`：编译入口。
- `build.lua`：`l3build` 构建配置。
- `info.tex`：填写内容入口，推荐只改这个文件。
- `xidian-midterm.cls`：模板类文件，负责加载 PDF 底图、绘制可填写区域并生成动态正文页。
- `西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf`：学校原始模板底图，不能删除或改名。

## 依赖

需要使用 XeLaTeX 编译。模板依赖常见 TeX Live 宏包：

```text
ctex
expl3
geometry
pdfpages
tcolorbox
tikz
xparse
```

macOS 推荐安装 MacTeX；Linux/Windows 推荐安装完整 TeX Live。

## 注意事项

- 本模板以当前仓库内的 PDF 为权威底图。如果学校更新模板，应替换该 PDF 并重新校准覆盖坐标。
- 不建议手工重画封面、填表说明和评审页。Word 导出的 PDF 在字体、字距、行高和边框上存在细节差异，手绘方案很难稳定复刻。
- 默认正文为动态可分页表框：横向宽度、边框样式和字号保持稳定，纵向长度随内容自动增加。
