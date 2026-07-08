# 西安电子科技大学硕士学位论文中期考核报告表 LaTeX 模板

本仓库提供“西安电子科技大学硕士学位论文中期考核报告表（学术学位）”的 LaTeX 可填写模板。模板以学校原始 PDF 为封面和填表说明的权威底图，正文与评审页由 LaTeX 绘制为可续页表框，适合需要稳定排版、可版本管理、可重复编译的中期考核材料。

## 当前能力

- 默认 `\printmidterm` 输出可填写版本：封面和填表说明沿用原始 PDF，正文和评审页使用 LaTeX 表框。
- 正文内容按实际长度自动分页，不再固定 6 页，也不会因为正文超长被固定框裁掉。
- 动态正文页保持固定横向版心、统一边框和稳定字号，长内容会在后续页面继续排版。
- 封面论文题目支持用 `\\` 显式分成两行，双行题目会重新绘制下划线以贴合原模板。
- 首页填写字段默认三号字，匹配学校模板首页字号。
- 保留 `\printfixedmidterm`，用于必须严格覆盖原始 6 页 PDF 的兼容场景。
- 保留 `\printtemplate`，可直接输出学校原始空白模板。
- 保留旧版 `\renewcommand` 字段接口，但推荐使用 `\midtermsetup`。

## 快速开始

安装完整 TeX Live 或 MacTeX 后，在仓库根目录执行：

```bash
xelatex main.tex
xelatex main.tex
```

生成结果为 `main.pdf`。如果本机安装了 `l3build`，也可以执行：

```bash
l3build doc
```

## 填写内容

推荐只编辑 `info.tex`。该文件默认提供一份可直接编译的示例数据，正式使用时替换为自己的信息即可。

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
    title = {基于深度学习的目标检测\\方法研究}
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
    achievements = {无。}
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

正文中如果需要英文逗号 `,`，请把整段内容放在 `{...}` 中，否则键值解析器会把逗号当作字段分隔符。

## 输出模式

默认可填写动态版本：

```tex
\printmidterm
```

输出学校原始空白模板：

```tex
\printtemplate
```

严格 6 页 PDF 覆盖版本：

```tex
\printfixedmidterm
```

`printfixedmidterm` 是兼容模式，适合短内容和必须完全沿用原 PDF 页面的场景。正文较长时应使用默认的 `\printmidterm`，否则固定区域外的内容仍可能被裁切。

## 字段参考

### `info`

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

| 键 | 对应区域 |
| --- | --- |
| `source` | 选题来源 |
| `research-goal` | 一、学位论文研究目标及研究内容 |
| `completed-work` | 二、目前已完成学位论文工作的内容 |
| `deviation` | 三、现阶段完成的工作与开题报告内容不相符的情况说明 |
| `next-plan` | 四、下一步工作计划及需要完成的研究内容和需要解决的关键技术 |
| `achievements` | 五、已发表的与学位论文相关的学术论文、其他研究成果以及拟发表的研究成果 |

### `review`

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

一般不需要修改。只有替换底图或微调字号时才使用：

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
    body-font = {\fontsize{12bp}{20bp}\selectfont}
  }
}
```

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

- `main.tex`：编译入口。
- `info.tex`：填写内容入口，正式使用时主要修改这个文件。
- `xidian-midterm.cls`：模板类文件，定义字段接口、覆盖层和动态正文页。
- `build.lua`：`l3build` 构建配置。
- `西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf`：学校原始 PDF 底图，不建议删除或改名。

## 依赖

必须使用 XeLaTeX。模板依赖常见 TeX Live 宏包：

```text
ctex
expl3
geometry
pdfpages
tcolorbox
tikz
xparse
```

macOS 推荐安装 MacTeX；Linux 和 Windows 推荐安装完整 TeX Live。

## 维护和验证

修改模板后建议至少执行：

```bash
xelatex -interaction=nonstopmode -halt-on-error main.tex
l3build doc
git diff --check
```

如果学校发布新版表格，应先替换 PDF 底图，再重新校准封面覆盖坐标和固定 6 页兼容模式坐标。默认动态正文模式不依赖原 PDF 的正文页背景，但仍应检查边距、边框和分页效果。

## 注意事项

- 本项目不手工重画封面和填表说明，避免 Word/PDF 转换导致字体、字距、行高和边框细节漂移。
- 默认动态模式优先保证正文完整输出；如果必须与原始 PDF 每页完全一致，请使用 `\printfixedmidterm` 并自行控制正文长度。
- 旧接口如 `\renewcommand{\XueHao}{2023123456}` 仍可使用，但新文档建议统一使用 `\midtermsetup`。
