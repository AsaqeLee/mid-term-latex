% xidian-midterm.cls
% 西安电子科技大学硕士学位论文中期考核报告表（学术学位）
% 严格复刻模式：直接复用学校原 PDF 模板，确保空白模板视觉一致。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xidian-midterm}[2026/07/03 v2.0 strict PDF replica]

\LoadClass[a4paper]{article}

\RequirePackage{pdfpages}

\pagestyle{empty}

% 权威模板 PDF。文件需与 main.tex 位于同一目录。
\newcommand{\MidtermTemplateFile}{西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf}

% 如需使用其他路径，可在导言区调用：
% \setmidtermtemplate{path/to/template.pdf}
\newcommand{\setmidtermtemplate}[1]{%
  \renewcommand{\MidtermTemplateFile}{#1}%
}

% 输出 6 页原始模板。fitpaper 会继承原 PDF 的 A4 页面尺寸。
\newcommand{\printtemplate}{%
  \includepdf[pages=-,fitpaper=true,pagecommand={}]{\MidtermTemplateFile}%
}

\endinput
