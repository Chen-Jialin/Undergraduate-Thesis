\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2020/05/019 Class for undergraduate thesis]

%% Options
% 其余变量传递给 article 类 Other options passed to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%% Load class
\LoadClass[UTF8, a4paper, scheme=chinese, oneside, zihao=5, linespread=1]{ctexbook} % 加载编码方式为 UTF8, 格局为 chinese, 纸张大小为 A4, 单边模式, 字号为五号, 行间距为 1 的 ctexbook 类 Load ctexbook class with UTF8 coding, A4 paper, chinese scheme, oneside style, Wuhao font and single line space

\RequirePackage[vmargin=1in, left=3.17cm, right=3.22cm]{geometry} % 页边距 Page margin

% 自定义页眉和页脚 Header and footer customization
\RequirePackage{fancyhdr} % 页眉和页脚 Header & footer
\RequirePackage{lastpage} % 返回末页页码 Return page number of the last page

% 数学公式 Mathematical equations
\RequirePackage{amsmath, amssymb, amsthm, bm} % 基础数学支持, 特殊数学符号, 自定义定理, 公式内加粗 Basic math support, special math symbols, theorem customization, bold in equations
\RequirePackage{mathrsfs} % 公式内花体字母 Non-CM calligraphic letters in equations
\RequirePackage{esint} % 特殊积分号 Special integral signs

% 图片 Figures
\RequirePackage{graphicx} % 插入图片 Insert graphics
\RequirePackage{float} % 强制设定图片位置 Set the positions of figures mandatorily
\RequirePackage{tikz} % 绘图 Create graphics

% 表格 Tables
\RequirePackage{multirow} % 表内多行单元格合并 Tables with merged multi-row cells
\RequirePackage{booktabs} % 三线表 Three-line tables
\RequirePackage{longtable} % 表格跨页 Cross-page tables
\RequirePackage{lscape} % 横排表格 Landscape tables
\RequirePackage{diagbox} % 对角线分割单元格 Cells saperated by diagonal lines

% 化学式 Chemstry formulas
\RequirePackage[version=4]{mhchem} % 基础化学式 Basic chemistry equations
\RequirePackage{chemfig} % 化学结构式 Chemistry structural formulas

\RequirePackage{listings} % 程序代码 Program code

% 其他 Others
\RequirePackage{setspace} % 局部行距 Local line space
\RequirePackage{ulem} % 各式下划线和删除标记 Various underlines & deletion notes
\normalem % 避免将意大利斜体 (\emph或\em) 替换为下划线 Avoide replacing italics (\emph or \em) with underlines
\RequirePackage{color} % 文本颜色 Text color
\RequirePackage{hyperref} % 超链接 Hyperlink
\RequirePackage{framed} % 文本加框 Framed text

\allowdisplaybreaks[4] % 公式跨页 Cross-page equations
\providecommand{\abs}[1]{\left\lvert#1\right\rvert} % 绝对值 Absolute value
\providecommand{\norm}[1]{\left\lVert#1\right\rVert} % 范数 Norm
\providecommand{\arcsinh}{\,\mathrm{arcsinh}\,} % 反双曲正弦 Inverse hyperbolic sine
\providecommand{\arccosh}{\,\mathrm{arccosh}\,} % 反双曲余弦 Inverse hyperbolic cosine
\providecommand{\arctanh}{\,\mathrm{arctanh}\,} % 反双曲正切 Inverse hyperbolic tangent
\providecommand{\re}{\,\mathrm{Re}\,} % 复数的实部 Real part of complex number
\providecommand{\im}{\,\mathrm{Im}\,} % 复数的虚部 Imaginary part of complex number
\providecommand{\sgn}{\,\mathrm{sgn}\,} % 符号函数 Sign function
\providecommand{\sinc}{\,\mathrm{sinc}\,} % 辛格函数 Sinc function
\providecommand{\rect}{\,\mathrm{rect}\,} % 矩形函数 Rectangular function
\providecommand{\tr}{\,\mathrm{Tr}\,} % 矩阵的迹 Trace of matrix

% 插入代码风格 Inserted code style
\lstset
{
    numbers=left, % 在左侧添加行号 Add line numbers at left
    frame=single, % 用单线框围绕代码 Enclose code with single-line frames
    breaklines=true, % 自动折行 Automatic line wrapping
    showspaces=true, % 显示空格 Show spaces
    showtabs=true, % 显示制表符 Show tabs
    tab=\rightarrowfill % 用右箭头填充制表符 Fill tabs with right arrows
}

% 超链接自动换行 Hyperlink automatic line wrapping
\makeatletter
\def\UrlAlphabet{%
      \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
      \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
      \do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
      \do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
      \do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
      \do\Y\do\Z}
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlAlphabet}
\g@addto@macro{\UrlBreaks}{\UrlDigits}
\makeatother

% Labels in structure
\renewcommand*{\contentsname}{目\quad{}录}
\renewcommand*{\bibname}{参考文献}
% Structure elements configuration
% chapter
\ctexset {
    chapter = {
        format = \linespread{1.0}\zihao{3}\bfseries\sffamily\centering,
        name = {第,章},
        number = \chinese{chapter},
        aftername = \quad,
        beforeskip = {1\baselineskip},
        afterskip = {1\baselineskip},
        pagestyle = plain,
    }
}
% section
\ctexset {
    section = {
        format = \indent\linespread{1}\zihao{4}\sffamily\raggedright,
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
% subsection
\ctexset {
    subsection = {
        format = \indent\linespread{1}\zihao{-4}\raggedright,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
% subsubsection
\ctexset {
    subsubsection = {
        format = \indent\linespread{1}\zihao{-4}\raggedright,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
% appendix
\ctexset {
    appendix = {
    }
}
%% 论文组件 Thesis components
\def\ULthickness{1.2pt}
\newcommand{\extend}[1]{\hbox to 350pt{\hfill#1\hfill}}% extend underline length
\newcommand{\schoolLogo}{\includegraphics[scale=0.2]{ShanghaiTechLogo.pdf}} % 学校徽标 School logo
% 中文封面
\renewcommand{\title}[1]{\def\Title{#1}} % 标题
\renewcommand{\author}[1]{\def\Author{#1}} % 学生姓名
\newcommand{\id}[1]{\def\ID{#1}} % 学号 Student ID
\newcommand{\entranceYear}[1]{\def\EntranceYear{#1}} % 入学年份 Entrance year
\newcommand{\institute}[1]{\def\Institute{#1}} % 学院
\newcommand{\major}[1]{\def\Major{#1}} % 专业
\newcommand{\advisor}[1]{\def\Advisor{#1}} % 导师
\renewcommand{\date}[1]{\def\Date{#1}} % 日期
\renewcommand{\maketitle}{%
    \cleardoublepage
    \thispagestyle{empty}
    {\schoolLogo}
    \begin{center}
        \begin{spacing}{1.2}
            \zihao{4}

            \vspace*{\stretch{2}}

            {\zihao{2}\bfseries\sffamily{本科毕业论文（设计）}}

            \vspace*{\stretch{4}}

            \def\tabcolsep{1pt}
            \def\arraystretch{1.3}
            \begin{tabular}{rc}
                题\qquad{}目： & \uline{\extend{\Title}}\\
                学生姓名： & \uline{\extend{\Author}}\\
                学\qquad{}号： & \uline{\extend{\ID}}\\
                入学年份： & \uline{\extend{\EntranceYear}}\\
                所在学院： & \uline{\extend{\Institute}}\\
                攻读专业： & \uline{\extend{\Major}}\\
                指导教师： & \uline{\extend{\Advisor}}
            \end{tabular}

            \vspace*{\stretch{5}}

            {\zihao{-4}上海科技大学}\\
            {\zihao{-4}\Date}
        \end{spacing}
    \end{center}
    \clearpage
}
% English cover
\newcommand{\titleEn}[1]{\def\TitleEn{#1}} % Title
\newcommand{\authorEn}[1]{\def\AuthorEn{#1}} % Student name
\newcommand{\advisorEn}[1]{\def\AdvisorEn{#1}} % Advisor
\newcommand{\majorEn}[1]{\def\MajorEn{#1}} % Major
\newcommand{\instituteEn}[1]{\def\InstituteEn{#1}} % School
\newcommand{\dateEn}[1]{\def\DateEn{#1}} % Date
\newcommand{\maketitleEn}{%
    \cleardoublepage
    \thispagestyle{empty}
    {\schoolLogo}
    \begin{center}
        \begin{spacing}{1.2}
            \zihao{4}

            \vspace*{\stretch{2}}

            {\zihao{2}\bfseries\sffamily{THESIS}}

            \vspace*{\stretch{4}}

            \def\tabcolsep{1pt}
            \def\arraystretch{1.3}

            \begin{tabular}{lc}
                Subject: & \uline{\extend{\TitleEn}}\\
                Student Name: & \uline{\extend{\AuthorEn}}\\
                Student ID: & \uline{\extend{\ID}}\\
                Year of Entrance: & \uline{\extend{\EntranceYear}}\\
                School: & \uline{\extend{\InstituteEn}}\\
                Major: & \uline{\extend{\MajorEn}}\\
                Advisor: & \uline{\extend{\AdvisorEn}}
            \end{tabular}

            \vspace*{\stretch{5}}

            {ShanghaiTech University}\\
            {Date: \DateEn}
        \end{spacing}
    \end{center}
    \clearpage
}
% 学术诚信声明和版权使用授权书 Academic integrity declaration and copyright authorization
\newcommand{\makedeclaration}{% 学术诚信声明 Academic integrity declaration
    \clearpage
    \thispagestyle{empty}
    \begin{spacing}{1.6}
        \vspace*{2\baselineskip}
        \begin{center}
            \zihao{-2}\bfseries\sffamily
            上海科技大学\\毕业论文（设计）学术诚信声明
        \end{center}

        \vspace*{1\baselineskip}

        {\zihao{4}%
            本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。

            \vspace*{3\baselineskip}

            \hfill\begin{tabular}{rl}
                作者签名： &  \\
                &  \\
                日\qquad{}期： & \qquad{}年\quad{}月\quad{}日
            \end{tabular}
        }
    \end{spacing}
    \clearpage
% 版权使用授权书 copyright authorization
    \thispagestyle{empty}
    \vspace*{2\baselineskip}
    \begin{center}\zihao{-2}\bfseries\sffamily{}上海科技大学\\毕业论文（设计）版权使用授权书\end{center}

    \vspace*{1\baselineskip}

    {\zihao{4}%
        本毕业论文（设计）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权上海科技大学可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业论文（设计）。

        本论文属于\quad\(\begin{array}{l}
            \text{\textbf{保密}$\openbox$，在\underline{\quad}年解密后适用本授权书。} \\
            \\
            \text{\textbf{不保密}$\openbox$。}
        \end{array}\)

        （请在以上方框内打“$\surd$”）

        \vspace*{3\baselineskip}

        \begin{center}
            \begin{tabular}{rl}
                作者签名： &  \\
                &  \\
                日\qquad{}期： & \qquad{}年\quad{}月\quad{}日
            \end{tabular}\hfill\begin{tabular}{rl}
                导师签名： &  \\
                &  \\
                日\qquad{}期： & \qquad{}年\quad{}月\quad{}日
            \end{tabular}
        \end{center}
    }
    \clearpage
}
% 中文摘要和关键词
\newcommand{\makeabstract}[2]{
    \vspace*{1\baselineskip}
    \begin{center}
        {\zihao{3}\bfseries\sffamily\Title

        \vspace*{1\baselineskip}}

        {\zihao{4}\sffamily{}摘\quad{}要}
    \end{center}

    \vspace*{1\baselineskip}

    \begin{spacing}{1}\zihao{5}#1\end{spacing}

    \vspace*{\baselineskip}

    \noindent{\sffamily{}关键词：#2}
    \clearpage
}
% English abstract and key words
\newcommand{\makeenglishabstract}[2]{
    \vspace*{1\baselineskip}
    \begin{center}
        {\zihao{3}\bfseries\MakeUppercase{\TitleEn}

        \vspace*{1\baselineskip}}

        {\zihao{4}\bfseries{}ABSTRACT}
    \end{center}

    \vspace*{1\baselineskip}

    \begin{spacing}{1}\zihao{5}#1\end{spacing}

    \vspace{\baselineskip}
    \noindent{\bfseries{}Key words: #2}
    \clearpage
}
% 目录 Content table
\RequirePackage{titletoc} % 目录 Content
\titlecontents{chapter}[3.8em]{}{\contentslabel{3.8em}}{}{\titlerule*{-}\contentspage}
\titlecontents{section}[3.8em]{}{\contentslabel{2.3em}}{}{\titlerule*{-}\contentspage}
\titlecontents{subsection}[6.1em]{}{\contentslabel{3.2em}}{}{\titlerule*{-}\contentspage}
% Platform fontset <windows>, <mac>, <adobe>, <times>, <others>
\RequirePackage{expl3}% LaTeX3 programming environment
\ExplSyntaxOn%
\providecommand{\g__ctex_fontset_tl}{}% platform fontset state variable
\edef\artxfontset{\g__ctex_fontset_tl}% expanded platform fontset state variable
\ExplSyntaxOff%
\newif\ifwindows \windowsfalse
\newif\ifmac \macfalse
\newif\ifadobe \adobefalse
\newif\iftimes \timesfalse
\newif\ifothers \othersfalse
\RequirePackage{etoolbox}% a toolbox of programming facilities
\newcommand{\artxifstreq}{\expandafter\ifstrequal\expandafter}% expansion control
\artxifstreq{\artxfontset}{windows}{\windowstrue\timestrue}{%
\artxifstreq{\artxfontset}{mac}{\mactrue\timestrue}{%
\artxifstreq{\artxfontset}{adobe}{\adobetrue\timestrue}{%
\otherstrue\timesfalse}}}
% LaTeX engine <pdflatex>, <lualatex>, <xelatex>
\newif\ifpdftex \pdftexfalse
\newif\ifluatex \luatexfalse
\newif\ifxetex \xetexfalse
\RequirePackage{ifxetex,ifluatex}% LaTeX engine detection
\ifxetex%
    \xetextrue
    \RequirePackage{xeCJK}% support calling system fonts
\else\ifluatex%
    \luatextrue
\else%
    \pdftextrue
\fi\fi%
% Bibliography engine <bibtex>, <biber>
\newif\ifbibtex \bibtextrue
\newif\ifbiber \biberfalse
% Citation and reference style
\newif\ifnumbers \numberstrue
\newif\ifsuper \supertrue
\newif\ifauthoryear \authoryearfalse
\newif\ifalpha \alphafalse
% Handle non-implemented options
\DeclareOption*{%
    \PackageWarning{artratex}{Unknown option '\CurrentOption'}%
}
\ProcessOptions\relax%

% Language settings
\ifpdftex% <pdflatex> call font packages
    \RequirePackage[utf8]{inputenc}% set input encoding, document must use utf-8 encoding
    \RequirePackage[T1]{fontenc}% set font encoding to enable modern font encoding
    \RequirePackage{newtxtext}%
    \RequirePackage[cmintegrals]{newtxmath}% load after math packages
\else% <xelatex> or <lualatex> call system fonts
    \RequirePackage[cmintegrals]{newtxmath}% math symbol font, load after math but before fontspec packages
    \RequirePackage{fontspec}% support calling system fonts
    \ifwindows%
        \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi]{SimSun}%
        \setCJKsansfont[AutoFakeBold]{SimHei}%
        \setCJKmonofont{FangSong}%
    \else\ifmac%
        \setCJKmainfont[ItalicFont=Kaiti SC,BoldItalicFont=Kaiti SC Bold]{Songti SC Light}%
        \setCJKsansfont{Heiti SC}%
        \setCJKmonofont{STFangsong}%
    \else\ifadobe%
        \setCJKmainfont[AutoFakeBold,ItalicFont=AdobeKaitiStd-Regular]{AdobeSongStd-Light}%
        \setCJKsansfont[AutoFakeBold]{AdobeHeitiStd-Regular}%
        \setCJKmonofont{AdobeFangsongStd-Regular}%
    \fi\fi\fi
    \iftimes%
        \setmainfont[NFSSFamily=entextrm]{Times New Roman}%
        \setsansfont[NFSSFamily=entextsf]{Times New Roman}%
    \else
        \setmainfont[NFSSFamily=entextrm]{FreeSerif}%
        \setsansfont[NFSSFamily=entextsf]{FreeSerif}%
    \fi
\fi
% Bibliography processor and package
\RequirePackage[square,comma,super,sort&compress]{natbib}% superscripted square bracket
\bibliographystyle{Biblio/gbt7714-unsrt}% numbered scheme
\providecommand*{\citetns}[2][]{% text embedded \citet in superscripted mode
    \begingroup%
        \let\NAT@mbox=\mbox%
        \let\@cite\NAT@citenum%
        \let\NAT@space\NAT@spacechar%
        \let\NAT@super@kern\relax%
        \renewcommand\NAT@open{[}%
        \renewcommand\NAT@close{]}%
        \citet[#1]{#2}%
    \endgroup%
}
\providecommand*{\citepns}[2][]{% text embedded \citep in superscripted mode
    \begingroup%
        \let\NAT@mbox=\mbox%
        \let\@cite\NAT@citenum%
        \let\NAT@space\NAT@spacechar%
        \let\NAT@super@kern\relax%
        \renewcommand\NAT@open{[}%
        \renewcommand\NAT@close{]}%
        \citep[#1]{#2}%
    \endgroup%
}
% Extensions and directories for graphics
% Declare graphic extensions for automatic selection when including graphics
% via avoiding supplying graphic extensions in \includegraphics command,
% the source file can be more general and adaptive
\ifxetex%
    \DeclareGraphicsExtensions{.pdf,.png,.jpg,.eps,.tif,.bmp,.gif}%
\else% <pdflatex> or <lualatex>
    \DeclareGraphicsExtensions{.pdf,.png,.jpg}%
\fi
\graphicspath{{./Img/}}% search path for figures
% Links support
\hypersetup{% set hyperlinks
    pdfencoding=auto,% allows non-Latin based languages in bookmarks
    pdffitwindow=false,% window fit to page when opened
    pdfstartview={FitH},% fits the width of the page to the window
    colorlinks=true,% false: boxed links; true: colored links
    linkcolor=black,% color of internal links
    citecolor=black,% color of links to bibliography
    %filecolor=magenta,% color of file links
    urlcolor=red,% color of external links
    bookmarksnumbered=true,% put section numbers in bookmarks
}
% Set bibliography entry
% \ifbibtex%
%     \setlength{\bibsep}{0.0ex plus 0.2ex minus 0.2ex}% set distance between entries
% \fi
% \ifbiber%
%     \setlength\bibitemsep{0.5\baselineskip}% set distance between entries
% \fi
% \renewcommand*{\bibfont}{\small}% set font size for bibliography
% Define different kinds of header and footer for different parts
\fancypagestyle{frontmatterstyle}{% 前页页眉页脚风格 Front matter header and footer style
    \fancyhf{}
    \fancyhead[L]{\includegraphics[width=8em]{ShanghaiTechLogo.pdf}}
    \fancyhead[R]{\zihao{-5}\sffamily\Title}
    \renewcommand{\headrulewidth}{0.8pt}
    \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{firstpagestyle}{% 首页页眉页脚风格 First page header and footer style
    \fancyhf{}
    \fancyfoot[C]{\footnotesize{}第 \thepage 页\quad{}共 \pageref{LastPage} 页}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{mainmatterstyle}{% 正文页眉页脚风格 Main matter header and footer style
    \fancyhf{}
    \fancyhead[L]{\includegraphics[width=8em]{ShanghaiTechLogo.pdf}}
    \fancyhead[R]{\zihao{-5}\sffamily\Title}
    \fancyfoot[C]{\footnotesize{}第 \thepage 页\quad{}共 \pageref{LastPage} 页}
    \renewcommand{\headrulewidth}{0.8pt}
    \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{backmatterstyle}{% 附录页眉页脚风格 Back matter header and footer style
    \fancyhf{}
    \fancyhead[L]{\includegraphics[width=8em]{ShanghaiTechLogo.pdf}}
    \fancyhead[R]{\zihao{-5}\sffamily\Title}
    \fancyfoot[C]{\zihao{-5}第 \thepage 页\quad{}共 \pageref{LastPage} 页}
    \renewcommand{\headrulewidth}{0.8pt}
    \renewcommand{\footrulewidth}{0pt}
}
% Redefine \frontmatter to include the change
\let\myfrontmatter\frontmatter%
\renewcommand{\frontmatter}{%
    \myfrontmatter%
    \zihao{5}
    \pagestyle{frontmatterstyle}%
}
% Redefine \mainmatter to include the change
\let\mymainmatter\mainmatter%
\renewcommand{\mainmatter}{%
    \mymainmatter%
    \zihao{5}
    \pagestyle{mainmatterstyle}%
}
% Redefine \backmatter to include the change
\let\mybackmatter\backmatter%
\renewcommand{\backmatter}{%
    \mybackmatter%
    \zihao{5}
    \pagestyle{backmatterstyle}%
}
\fancypagestyle{plain}{}
\setlength{\headheight}{32pt}
