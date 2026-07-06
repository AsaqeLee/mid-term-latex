% xidian-midterm.cls
% 西安电子科技大学硕士学位论文中期考核报告表（学术学位）
% PDF 底图 + 可填写叠加层。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xidian-midterm}[2026/07/06 v4.2 dynamic body pages]

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
  \newgeometry{left=29mm,right=29mm,top=22mm,bottom=24mm}%
  \pagestyle{empty}%
}

\newcommand{\MidtermDynamicHeading}[1]{%
  \noindent{\bfseries #1}\par
}

\newtcolorbox{MidtermDynamicBox}[1][]{%
  enhanced,
  breakable,
  colback=white,
  colframe=black,
  boxrule=0.5pt,
  arc=0pt,
  left=6pt,
  right=6pt,
  top=6pt,
  bottom=6pt,
  fontupper=\MidtermBodyFont,
  before upper={\setlength{\parindent}{2em}\setlength{\parskip}{0pt}},
  before skip=0pt,
  after skip=12pt,
  #1%
}

\newcommand{\MidtermDynamicSection}[2]{%
  \begin{MidtermDynamicBox}
  #1%
  \par\medskip
  #2%
  \end{MidtermDynamicBox}%
}

\newcommand{\MidtermDynamicBodyPages}{%
  \clearpage
  \MidtermDynamicGeometry
  \MidtermDynamicSection{%
    选题来源：\XuanTiLaiYuan
    \par\medskip
    \MidtermDynamicHeading{一、学位论文研究目标及研究内容}%
    （与开题报告中的研究目标和研究内容一致。）%
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
    \MidtermCoverLineField{170}{369}{285}{\LunWenTiMu}
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
  \clearpage
  \includepdf[pages=6,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageSixOverlay}]{\MidtermTemplateFile}%
}

\endinput
