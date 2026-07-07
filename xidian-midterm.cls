% xidian-midterm.cls
% 西安电子科技大学硕士学位论文中期考核报告表（学术学位）
% PDF 底图 + 可填写叠加层。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xidian-midterm}[2026/07/07 v4.6 Zhu-style frames]

\LoadClass[a4paper]{article}

\RequirePackage{expl3}
\RequirePackage{xparse}
\RequirePackage[UTF8]{ctex}
\RequirePackage{geometry}
\RequirePackage{pdfpages}
\RequirePackage{tcolorbox}
\RequirePackage{tikz}
\tcbuselibrary{breakable,skins}

\pagestyle{empty}

% 权威模板 PDF。文件需与 main.tex 位于同一目录。
\newcommand{\MidtermTemplateFile}{西安电子科技大学硕士学位论文中期考核报告表（学术学位）.pdf}

% 如需使用其他路径，可在导言区调用：
% \setmidtermtemplate{path/to/template.pdf}
\newcommand{\setmidtermtemplate}[1]{%
  \renewcommand{\MidtermTemplateFile}{#1}%
}

% ========== 用户可覆盖字段 ==========
\newcommand{\XueHao}{}
\newcommand{\XingMing}{}
\newcommand{\YiJiXueKe}{}
\newcommand{\ErJiXueKe}{}
\newcommand{\ZhiDaoJiaoShi}{}
\newcommand{\XueYuan}{}
\newcommand{\BaoGaoRiQi}{}
\newcommand{\LunWenTiMu}{}

\newcommand{\XuanTiLaiYuan}{}
\newcommand{\YanJiuMuBiao}{}
\newcommand{\YiWanChengGongZuo}{}
\newcommand{\BuXiangFuShuoMing}{}
\newcommand{\XiaYiBuJiHua}{}
\newcommand{\XueShuChengGuo}{}

\newcommand{\DaoShiPingJia}{}
\newcommand{\DaoShiQianMing}{}
\newcommand{\DaoShiNian}{}
\newcommand{\DaoShiYue}{}
\newcommand{\DaoShiRi}{}

\newcommand{\ZhongQiPingYu}{}
\newcommand{\ZuZhangQianMing}{}
\newcommand{\ChengYuanQianMing}{}
\newcommand{\KaoHeNian}{}
\newcommand{\KaoHeYue}{}
\newcommand{\KaoHeRi}{}

% ========== xduts 风格键值接口 ==========
\ExplSyntaxOn
\keys_define:nn { xidian-midterm / info }
  {
    student-id .code:n = { \cs_set:Npn \XueHao {#1} },
    name .code:n = { \cs_set:Npn \XingMing {#1} },
    first-level-discipline .code:n = { \cs_set:Npn \YiJiXueKe {#1} },
    second-level-discipline .code:n = { \cs_set:Npn \ErJiXueKe {#1} },
    supervisor .code:n = { \cs_set:Npn \ZhiDaoJiaoShi {#1} },
    school .code:n = { \cs_set:Npn \XueYuan {#1} },
    report-date .code:n = { \cs_set:Npn \BaoGaoRiQi {#1} },
    title .code:n = { \cs_set:Npn \LunWenTiMu {#1} }
  }

\keys_define:nn { xidian-midterm / content }
  {
    source .code:n = { \cs_set:Npn \XuanTiLaiYuan {#1} },
    research-goal .code:n = { \cs_set:Npn \YanJiuMuBiao {#1} },
    completed-work .code:n = { \cs_set:Npn \YiWanChengGongZuo {#1} },
    deviation .code:n = { \cs_set:Npn \BuXiangFuShuoMing {#1} },
    next-plan .code:n = { \cs_set:Npn \XiaYiBuJiHua {#1} },
    achievements .code:n = { \cs_set:Npn \XueShuChengGuo {#1} }
  }

\keys_define:nn { xidian-midterm / review }
  {
    supervisor-comment .code:n = { \cs_set:Npn \DaoShiPingJia {#1} },
    supervisor-sign .code:n = { \cs_set:Npn \DaoShiQianMing {#1} },
    supervisor-year .code:n = { \cs_set:Npn \DaoShiNian {#1} },
    supervisor-month .code:n = { \cs_set:Npn \DaoShiYue {#1} },
    supervisor-day .code:n = { \cs_set:Npn \DaoShiRi {#1} },
    committee-comment .code:n = { \cs_set:Npn \ZhongQiPingYu {#1} },
    chair-sign .code:n = { \cs_set:Npn \ZuZhangQianMing {#1} },
    member-sign .code:n = { \cs_set:Npn \ChengYuanQianMing {#1} },
    committee-year .code:n = { \cs_set:Npn \KaoHeNian {#1} },
    committee-month .code:n = { \cs_set:Npn \KaoHeYue {#1} },
    committee-day .code:n = { \cs_set:Npn \KaoHeRi {#1} }
  }

\keys_define:nn { xidian-midterm / style }
  {
    template-file .code:n = { \cs_set:Npn \MidtermTemplateFile {#1} },
    cover-field-font .code:n = { \cs_set:Npn \MidtermCoverFieldFont {#1} },
    field-font .code:n = { \cs_set:Npn \MidtermFieldFont {#1} },
    body-font .code:n = { \cs_set:Npn \MidtermBodyFont {#1} },
    small-font .code:n = { \cs_set:Npn \MidtermSmallFont {#1} }
  }

\keys_define:nn { xidian-midterm }
  {
    info .meta:nn = { xidian-midterm / info } {#1},
    content .meta:nn = { xidian-midterm / content } {#1},
    review .meta:nn = { xidian-midterm / review } {#1},
    style .meta:nn = { xidian-midterm / style } {#1}
  }

\NewDocumentCommand \midtermsetup { +m }
  { \keys_set:nn { xidian-midterm } {#1} }
\NewDocumentCommand \MidtermSetup { +m }
  { \midtermsetup {#1} }
\ExplSyntaxOff

% ========== 字体 ==========
\newcommand{\MidtermCoverFieldFont}{\zihao{3}\selectfont}
\newcommand{\MidtermFieldFont}{\fontsize{12bp}{20bp}\selectfont}
\newcommand{\MidtermBodyFont}{\fontsize{12bp}{20bp}\selectfont}
\newcommand{\MidtermSmallFont}{\fontsize{10.5bp}{16bp}\selectfont}

% ========== 动态正文页 ==========
\newcommand{\MidtermDynamicGeometry}{%
  \newgeometry{left=82.8bp,right=82.8bp,top=52.8bp,bottom=76.8bp}%
  \pagestyle{empty}%
}

\newcommand{\MidtermDynamicHeading}[1]{%
  \noindent{\bfseries #1}\par
}

\newcommand{\MidtermDynamicFrameOverlay}{%
  \draw[black,line width=0.5pt]
    ([xshift=0.25pt,yshift=-0.25pt]frame.north west)
    -- ([xshift=-0.25pt,yshift=-0.25pt]frame.north east)
    -- ([xshift=-0.25pt,yshift=0.25pt]frame.south east)
    -- ([xshift=0.25pt,yshift=0.25pt]frame.south west)
    -- cycle;
}

\newcommand{\MidtermDynamicSourceRuleOverlay}{%
  \draw[black,line width=0.5pt]
    ([xshift=0.25pt,yshift=-23.4bp]frame.north west)
    -- ([xshift=-0.25pt,yshift=-23.4bp]frame.north east);
}

\newtcolorbox{MidtermDynamicBox}[1][]{%
  enhanced,
  breakable,
  height fixed for=all,
  toprule at break=0.5pt,
  bottomrule at break=0.5pt,
  colback=white,
  colframe=black,
  frame hidden,
  boxrule=0.5pt,
  arc=0pt,
  left=6pt,
  right=6pt,
  top=6pt,
  bottom=6pt,
  fontupper=\MidtermBodyFont,
  before upper={\setlength{\parindent}{2em}\setlength{\parskip}{0pt}},
  overlay unbroken={\MidtermDynamicFrameOverlay\MidtermDynamicSourceRuleOverlay},
  overlay first={\MidtermDynamicFrameOverlay\MidtermDynamicSourceRuleOverlay},
  overlay middle={\MidtermDynamicFrameOverlay},
  overlay last={\MidtermDynamicFrameOverlay},
  overlay unbroken and first={%
    \MidtermDynamicFrameOverlay
    \MidtermDynamicSourceRuleOverlay
  },
  before skip=28.8bp,
  after skip=0pt,
  #1%
}

\newcommand{\MidtermDynamicSection}[2]{%
  #1%
  \par\medskip
  #2%
  \par\medskip
}

\newcommand{\MidtermDynamicBodyPages}{%
  \clearpage
  \MidtermDynamicGeometry
  \begin{MidtermDynamicBox}
  \MidtermDynamicSection{%
    \noindent 选题来源：\XuanTiLaiYuan
    \par\medskip
    \MidtermDynamicHeading{一、学位论文研究目标及研究内容}%
    \noindent（与开题报告中的研究目标和研究内容一致。）%
  }{\YanJiuMuBiao}%
  \MidtermDynamicSection{%
    \MidtermDynamicHeading{二、目前已完成学位论文工作的内容}%
    （主要包括所完成的理论和实验研究以及所获得的结论。）%
  }{\YiWanChengGongZuo}%
  \MidtermDynamicSection{%
    \MidtermDynamicHeading{三、现阶段完成的工作与开题报告内容不相符的情况说明}%
  }{\BuXiangFuShuoMing}%
  \MidtermDynamicSection{%
    \MidtermDynamicHeading{四、下一步工作计划及需要完成的研究内容和需要解决的关键技术}%
  }{\XiaYiBuJiHua}%
  \MidtermDynamicSection{%
    \MidtermDynamicHeading{五、已发表的与学位论文相关的学术论文、其他研究成果以及拟发表的研究成果}%
  }{\XueShuChengGuo}%
  \end{MidtermDynamicBox}%
}

% ========== 覆盖层工具 ==========
% 坐标单位使用 PDF bp，原点为页面左上角，x 向右，y 向下。
\newcommand{\MidtermAt}[4][]{%
  \node[anchor=north west,inner sep=0pt,outer sep=0pt,#1]
    at ([xshift=#2bp,yshift=-#3bp]current page.north west) {#4};%
}

\newcommand{\MidtermAtBase}[4][]{%
  \node[anchor=base west,inner sep=0pt,outer sep=0pt,#1]
    at ([xshift=#2bp,yshift=-#3bp]current page.north west) {#4};%
}

\newcommand{\MidtermLineField}[4]{%
  \MidtermAtBase{#1}{#2}{\makebox[#3bp][c]{\raisebox{2bp}{\MidtermFieldFont #4}}}%
}

\newcommand{\MidtermCoverLineField}[4]{%
  \MidtermAtBase{#1}{#2}{\makebox[#3bp][c]{\raisebox{2bp}{\MidtermCoverFieldFont #4}}}%
}

\ExplSyntaxOn
\seq_new:N \l__midterm_cover_title_seq
\cs_new_protected:Npn \__midterm_cover_title_field:nnnn #1#2#3#4
  {
    \tl_if_blank:nTF {#4}
      { \MidtermCoverLineField {#1} {#2} {#3} { } }
      {
        \pgfmathsetmacro \midtermTitleEraseX { #1 - 2 }
        \pgfmathsetmacro \midtermTitleEraseY { #2 - 18 }
        \pgfmathsetmacro \midtermTitleEraseWidth { #3 + 6 }
        \fill [white]
          ([xshift=\midtermTitleEraseX bp,yshift=-\midtermTitleEraseY bp]current~page.north~west)
          rectangle ++(\midtermTitleEraseWidth bp,-76bp);
        \seq_set_split:Nnn \l__midterm_cover_title_seq { \\ } {#4}
        \seq_map_indexed_inline:Nn \l__midterm_cover_title_seq
          {
            \tl_if_blank:nF {##2}
              {
                \pgfmathsetmacro \midtermTitleY { #2 + (##1 - 1) * 30 }
                \MidtermAtBase {#1} {\midtermTitleY} {
                  \makebox [#3bp] [c] {
                    \raisebox {2bp} {
                      \MidtermCoverFieldFont
                      \underline {##2}
                    }
                  }
                }
              }
          }
      }
  }
\cs_generate_variant:Nn \__midterm_cover_title_field:nnnn { nnno }
\NewDocumentCommand \MidtermCoverTitleField { m m m +m }
  { \__midterm_cover_title_field:nnno {#1} {#2} {#3} {#4} }
\ExplSyntaxOff

\newcommand{\MidtermTextArea}[5]{%
  \begin{scope}
    \coordinate (midterm-area) at ([xshift=#1bp,yshift=-#2bp]current page.north west);
    \clip (midterm-area) rectangle ++(#3bp,-#4bp);
    \node[anchor=north west,inner sep=0pt,outer sep=0pt,text width=#3bp,align=left]
      at (midterm-area) {%
        \begin{minipage}[t]{#3bp}
          \MidtermBodyFont
          \setlength{\parindent}{2em}%
          \setlength{\parskip}{0pt}%
          #5%
        \end{minipage}%
      };%
  \end{scope}%
}

\newcommand{\MidtermSmallTextArea}[5]{%
  \begin{scope}
    \coordinate (midterm-area) at ([xshift=#1bp,yshift=-#2bp]current page.north west);
    \clip (midterm-area) rectangle ++(#3bp,-#4bp);
    \node[anchor=north west,inner sep=0pt,outer sep=0pt,text width=#3bp,align=left]
      at (midterm-area) {%
        \begin{minipage}[t]{#3bp}
          \MidtermSmallFont
          \setlength{\parindent}{2em}%
          \setlength{\parskip}{0pt}%
          #5%
        \end{minipage}%
      };%
  \end{scope}%
}

% ========== 页面覆盖层 ==========
\newcommand{\MidtermCoverOverlay}{%
  \begin{tikzpicture}[remember picture,overlay]
    \MidtermCoverLineField{437}{99}{78}{\XueHao}
    \MidtermCoverTitleField{170}{369}{285}{\LunWenTiMu}
    \MidtermCoverLineField{262}{491}{145}{\XingMing}
    \MidtermCoverLineField{262}{526}{145}{\YiJiXueKe}
    \MidtermCoverLineField{262}{561}{145}{\ErJiXueKe}
    \MidtermCoverLineField{262}{595}{145}{\ZhiDaoJiaoShi}
    \MidtermCoverLineField{262}{630}{145}{\XueYuan}
    \MidtermCoverLineField{262}{664}{145}{\BaoGaoRiQi}
  \end{tikzpicture}%
}

\newcommand{\MidtermPageThreeOverlay}{%
  \begin{tikzpicture}[remember picture,overlay]
    \MidtermAtBase{153}{81}{\MidtermBodyFont \XuanTiLaiYuan}
    \MidtermTextArea{89}{136}{420}{585}{\YanJiuMuBiao}
  \end{tikzpicture}%
}

\newcommand{\MidtermPageFourOverlay}{%
  \begin{tikzpicture}[remember picture,overlay]
    \MidtermTextArea{89}{112}{420}{610}{\YiWanChengGongZuo}
  \end{tikzpicture}%
}

\newcommand{\MidtermPageFiveOverlay}{%
  \begin{tikzpicture}[remember picture,overlay]
    \MidtermTextArea{89}{88}{420}{145}{\BuXiangFuShuoMing}
    \MidtermTextArea{89}{268}{420}{145}{\XiaYiBuJiHua}
    \MidtermTextArea{89}{448}{420}{275}{\XueShuChengGuo}
  \end{tikzpicture}%
}

\newcommand{\MidtermPageSixOverlay}{%
  \begin{tikzpicture}[remember picture,overlay]
    \MidtermSmallTextArea{104}{92}{410}{185}{\DaoShiPingJia}
    \MidtermAtBase{417}{301}{\MidtermFieldFont \DaoShiQianMing}
    \MidtermLineField{294}{321}{30}{\DaoShiNian}
    \MidtermLineField{344}{321}{18}{\DaoShiYue}
    \MidtermLineField{380}{321}{18}{\DaoShiRi}

    \MidtermSmallTextArea{104}{397}{410}{250}{\ZhongQiPingYu}
    \MidtermAtBase{393}{672}{\MidtermFieldFont \ZuZhangQianMing}
    \MidtermAtBase{381}{713}{\MidtermFieldFont \ChengYuanQianMing}
    \MidtermLineField{300}{753}{30}{\KaoHeNian}
    \MidtermLineField{344}{753}{18}{\KaoHeYue}
    \MidtermLineField{380}{753}{18}{\KaoHeRi}
  \end{tikzpicture}%
}

\newcommand{\MidtermReviewSideLabel}[3]{%
  \MidtermAt{#1}{#2}{%
    \makebox[18bp][c]{%
      \begin{minipage}{18bp}
        \centering\bfseries\fontsize{12bp}{18bp}\selectfont #3%
      \end{minipage}%
    }%
  }%
}

\newcommand{\MidtermReviewPrompt}[3]{%
  \MidtermAt{#1}{#2}{%
    \begin{minipage}[t]{405bp}
      \MidtermBodyFont
      \setlength{\parindent}{0pt}%
      #3%
    \end{minipage}%
  }%
}

\newcommand{\MidtermReviewPage}{%
  \clearpage
  \thispagestyle{empty}%
  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=0.5pt]
      ([xshift=75.6bp,yshift=-52.8bp]current page.north west)
      rectangle
      ([xshift=519.6bp,yshift=-736.2bp]current page.north west);
    \draw[line width=0.5pt]
      ([xshift=98.4bp,yshift=-52.8bp]current page.north west)
      --
      ([xshift=98.4bp,yshift=-736.2bp]current page.north west);
    \draw[line width=0.5pt]
      ([xshift=75.6bp,yshift=-324bp]current page.north west)
      --
      ([xshift=519.6bp,yshift=-324bp]current page.north west);

    \MidtermReviewSideLabel{78}{118}{指\\导\\教\\师\\评\\价\\意\\见}
    \MidtermReviewSideLabel{78}{430}{中\\期\\总\\结\\报\\告\\评\\语\\及\\结\\论}

    \MidtermReviewPrompt{109}{61}{（重点写出该生的表现、计划完成情况、对后续工作情况的估计等。）}
    \MidtermSmallTextArea{110}{92}{385}{165}{\DaoShiPingJia}
    \MidtermAtBase{333}{286}{\MidtermFieldFont 指导教师签名：\DaoShiQianMing}
    \MidtermLineField{338}{309}{30}{\DaoShiNian}
    \MidtermLineField{382}{309}{18}{\DaoShiYue}
    \MidtermLineField{424}{309}{18}{\DaoShiRi}
    \MidtermAtBase{372}{309}{\MidtermFieldFont 年}
    \MidtermAtBase{410}{309}{\MidtermFieldFont 月}
    \MidtermAtBase{452}{309}{\MidtermFieldFont 日}

    \MidtermReviewPrompt{109}{333}{%
      （中期考核结论分为两种：1. 通过，按专家意见修改后继续学位论文撰写工作；\\
      2. 不通过，重新考核。评语重点指出中期报告存在的问题并提出具体修改意见\\
      和建议。）}
    \MidtermSmallTextArea{110}{397}{385}{240}{\ZhongQiPingYu}
    \MidtermAtBase{333}{652}{\MidtermFieldFont 组长签名：\ZuZhangQianMing}
    \MidtermAtBase{333}{695}{\MidtermFieldFont 成员签名：\ChengYuanQianMing}
    \MidtermLineField{338}{730}{30}{\KaoHeNian}
    \MidtermLineField{382}{730}{18}{\KaoHeYue}
    \MidtermLineField{424}{730}{18}{\KaoHeRi}
    \MidtermAtBase{372}{730}{\MidtermFieldFont 年}
    \MidtermAtBase{410}{730}{\MidtermFieldFont 月}
    \MidtermAtBase{452}{730}{\MidtermFieldFont 日}
  \end{tikzpicture}%
  \null\clearpage
}

% ========== 输出命令 ==========
% 仅输出原始空白模板。
\newcommand{\printtemplate}{%
  \includepdf[pages=-,fitpaper=true,pagecommand={}]{\MidtermTemplateFile}%
}

% 输出固定 6 页覆盖版本。保留给需要严格覆盖原 PDF 的场景。
\newcommand{\printfixedmidterm}{%
  \includepdf[pages=1,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermCoverOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=2,fitpaper=true,pagecommand={\thispagestyle{empty}}]{\MidtermTemplateFile}%
  \includepdf[pages=3,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageThreeOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=4,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageFourOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=5,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageFiveOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=6,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageSixOverlay}]{\MidtermTemplateFile}%
}

% 输出内容驱动的可填写版本。正文使用可分页框，页数随内容增长。
\newcommand{\printmidterm}{%
  \includepdf[pages=1,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermCoverOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=2,fitpaper=true,pagecommand={\thispagestyle{empty}}]{\MidtermTemplateFile}%
  \MidtermDynamicBodyPages
  \MidtermReviewPage
}

\endinput
