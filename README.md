# Xidian Mid-Term Assessment LaTeX Template

LaTeX template for the **Xidian University master’s degree mid-term assessment report form (academic degree)**. Cover and instruction pages reuse the official PDF as the authoritative backdrop; body and review pages are drawn by LaTeX so content can paginate cleanly under version control.

## Features / scope

- Default `\printmidterm`: fillable mode with official PDF cover/instructions and LaTeX body/review frames
- Body pages paginate with content length (not hard-locked to six pages)
- Stable landscape text block, borders, and font sizes across continuation pages
- Cover title supports explicit two-line breaks via `\\`
- Cover fields default to size-3 Chinese characters to match the school form
- `\printfixedmidterm`: compatibility mode that overlays the original six-page PDF
- `\printtemplate`: print the blank official template PDF
- Preferred configuration API: `\midtermsetup` (legacy `\renewcommand` field hooks remain)

## Requirements

- XeLaTeX
- Full TeX Live or MacTeX recommended
- Common packages: `ctex`, `expl3`, `geometry`, `pdfpages`, `tcolorbox`, `tikz`, `xparse`
- Optional: `l3build` for `l3build doc`

## Getting started

```bash
xelatex main.tex
xelatex main.tex
```

Output: `main.pdf`.

Optional:

```bash
l3build doc
```

## Filling content

Edit `info.tex` (sample data is provided). Example:

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
    research-goal = {…},
    completed-work = {…},
    deviation = {…},
    next-plan = {…},
    achievements = {无。}
  },
  review = {
    supervisor-comment = {…},
    supervisor-sign = {李四},
    supervisor-year = {2026},
    supervisor-month = {7},
    supervisor-day = {3},
    committee-comment = {…},
    chair-sign = {王五},
    member-sign = {赵六、钱七},
    committee-year = {2026},
    committee-month = {7},
    committee-day = {3}
  }
}
```

If a field value must contain an ASCII comma `,`, wrap the whole value in `{...}` so the key–value parser does not treat the comma as a separator.

## Output modes

```tex
\printmidterm        % default fillable dynamic body
\printtemplate       % blank official PDF
\printfixedmidterm   % strict 6-page overlay compatibility
```

Prefer `\printmidterm` for long body text. Use `\printfixedmidterm` only when short content must align with the original PDF pages.

## Field reference

### `info`

`student-id`, `name`, `first-level-discipline`, `second-level-discipline`, `supervisor`, `school`, `report-date`, `title`

### `content`

| Key | Form section |
|-----|----------------|
| `source` | Topic source |
| `research-goal` | Research goals and content |
| `completed-work` | Work completed so far |
| `deviation` | Deviations from the proposal |
| `next-plan` | Next steps and open problems |
| `achievements` | Publications and related results |

### `review`

Supervisor and committee comments, signatures, and date fields (`supervisor-*`, `committee-*`, `chair-sign`, `member-sign`).

### `style`

Usually unchanged. Use only when replacing the backdrop PDF or tuning fonts (`template-file`, `cover-field-font`, `field-font`, `body-font`, `small-font`).

## Project layout

```text
.
├── main.tex
├── info.tex
├── xidian-midterm.cls
├── build.lua
└── 西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf
```

## Status / limitations

Unofficial community template. Always confirm the current official form with your school. Do not delete or rename the bundled PDF backdrop without recalibrating overlay coordinates. Dynamic mode prioritizes complete body text over pixel-perfect match to every original PDF page.
