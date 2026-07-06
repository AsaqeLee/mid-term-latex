# 西安电子科技大学硕士学位论文中期考核报告表（学术学位）LaTeX 模板

这是一个面向西安电子科技大学硕士学位论文中期考核报告表的 LaTeX 模板。项目采用“原始 PDF 底图 + LaTeX 覆盖层”的实现方式：表格框线、页面尺寸和模板文字来自学校原始 PDF，用户填写内容由 LaTeX 叠加到固定区域内。

## 特性

- 保留原始 6 页 A4 模板版式。
- 使用类似 `xduts` 的 `\midtermsetup{...}` 键值接口填写内容。
- 支持填写封面信息、正文内容、导师评价、考核评语、签名和日期。
- 首页填写内容默认使用三号字，与首页模板字号一致。
- 正文区域固定：内容不会撑开框线、不会改变页数，超出固定区域会被裁掉。
- `info.tex` 留空时，生成结果与原始空白模板一致。
- 保留 `\printtemplate`，可直接输出纯空白模板。

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
      本研究面向若干实际应用场景，围绕关键问题开展理论分析、算法设计与实验验证。
    }
  },
  review = {
    supervisor-comment = {
      该生按计划推进课题研究，已完成阶段性工作，同意进入下一阶段。
    },
    supervisor-sign = {李四},
    supervisor-year = {2026},
    supervisor-month = {7},
    supervisor-day = {3}
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

第 6 页评价、签名和日期：

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
| `small-font` | 第 6 页评语字体命令 |

示例：

```tex
\midtermsetup{
  style = {
    template-file = {西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf}
  }
}
```

## 输出模式

默认 `main.tex` 输出可填写版本：

```tex
\printmidterm
```

如果只想输出原始空白模板，可改为：

```tex
\printtemplate
```

## 固定框策略

本模板不会根据正文长度改变原始表格：

- 内容较短时，框线和页面布局保持原样。
- 内容较长时，超出固定区域的部分会被裁掉。
- 如需填写长段落，应主动压缩文字，或按学校要求另附材料。

这个策略的目标是保持学校表格样式稳定，避免内容越多、模板越不像原件。

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
- `xidian-midterm.cls`：模板类文件，负责加载 PDF 底图和叠加内容。
- `西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf`：权威模板底图，不能删除或改名。

## 依赖

需要使用 XeLaTeX 编译。模板依赖常见 TeX Live 宏包：

```text
ctex
expl3
pdfpages
tikz
xparse
```

macOS 推荐安装 MacTeX；Linux/Windows 推荐安装完整 TeX Live。

## 注意事项

- 本模板以当前仓库内的 PDF 为权威底图。如果学校更新模板，应替换该 PDF 并重新校准覆盖坐标。
- 不建议手工重画表格。Word 导出的 PDF 在字体、字距、行高和边框上存在细节差异，手绘方案很难稳定复刻。
- 当前版本不提供自动续页。固定框内的内容需要使用者自行控制长度。
