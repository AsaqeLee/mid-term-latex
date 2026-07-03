% xidian-midterm.cls
% 西安电子科技大学硕士学位论文中期考核报告表（学术学位）
% PDF 底图 + 可填写叠加层。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xidian-midterm}[2026/07/03 v3.0 fillable PDF overlay]

\LoadClass[a4paper]{article}

\RequirePackage[UTF8]{ctex}
\RequirePackage{pdfpages}
\RequirePackage{tikz}

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

% ========== 字体 ==========
\newcommand{\MidtermFieldFont}{\fontsize{12bp}{20bp}\selectfont}
\newcommand{\MidtermBodyFont}{\fontsize{12bp}{20bp}\selectfont}
\newcommand{\MidtermSmallFont}{\fontsize{10.5bp}{16bp}\selectfont}

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
    \MidtermLineField{437}{99}{78}{\XueHao}
    \MidtermLineField{170}{369}{285}{\LunWenTiMu}
    \MidtermLineField{262}{491}{145}{\XingMing}
    \MidtermLineField{262}{526}{145}{\YiJiXueKe}
    \MidtermLineField{262}{561}{145}{\ErJiXueKe}
    \MidtermLineField{262}{595}{145}{\ZhiDaoJiaoShi}
    \MidtermLineField{262}{630}{145}{\XueYuan}
    \MidtermLineField{262}{664}{145}{\BaoGaoRiQi}
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

% 输出可填写版本。字段为空时视觉上仍为原始空白模板。
\newcommand{\printmidterm}{%
  \includepdf[pages=1,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermCoverOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=2,fitpaper=true,pagecommand={\thispagestyle{empty}}]{\MidtermTemplateFile}%
  \includepdf[pages=3,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageThreeOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=4,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageFourOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=5,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageFiveOverlay}]{\MidtermTemplateFile}%
  \includepdf[pages=6,fitpaper=true,pagecommand={\thispagestyle{empty}},picturecommand={\MidtermPageSixOverlay}]{\MidtermTemplateFile}%
}

\endinput
