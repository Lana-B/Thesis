\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDThesis}
\LoadClass[a4paper,12pt,titlepage, twoside]{book} % this class is based on 'book'
\usepackage[T1]{fontenc}      % T1-encoded fonts: also words with special
\usepackage[final]{graphicx}  % to include graphics
\usepackage{makeidx}          % to build an index
\usepackage[a4paper]{geometry} % easy margin setup for the page
\usepackage{fancyhdr}         % nice headings
\usepackage{amsmath}
%tables
\usepackage{array}          % for advanced tables
\usepackage{colortbl}       % color tables
\usepackage{longtable}      % tables which go over a page

\usepackage{siunitx}
\sisetup{number-unit-product = \text{ }}
\sisetup{binary-units = true}
\sisetup{seperr, openerr=, closeerr=}
\usepackage[T1]{url} % much like \verb allow line breaks for paths and URLs
\usepackage{multirow}
\usepackage{booktabs}
\usepackage[section]{placeins}
\usepackage{ifthen}
\usepackage{xspace}
\usepackage{notoccite}
\usepackage{subfig}
 
% \usepackage{fancybox} % for shaded oval boxes
% \usepackage{tabularx} %automatic col width
% \usepackage{supertab} % big tables
% \usepackage[svnon,svnfoot]{svnver} % SVN version information
%% ---------------- end of usepackages -------------


%% Options
% draft - loads titlepage, Index etc.
% therefore  (\ifnotdraft{\include{...}}). is needed in main file
% relaxed - allows loose margins with automatic line wrapping
% pdf     - sets options for pdflatex
\DeclareOption{draft}{\let\@draft\@empty}
\DeclareOption{relaxed}{\tolerance=1500 \emergencystretch=12pt}
\DeclareOption{pdf}{\@usepdfttrue}

%% Modifications
\let\@draft\@undefined %no draft
\newif\if@usepdf \@usepdffalse % not pdf ready
\ProcessOptions

\setcounter{secnumdepth}{3} % numbering for subsubsectoin
\setcounter{tocdepth}{3}    % include subsubsection also in the index

%TODO: Comment 
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000

%% New Commands
\newcommand{\ifnotdraft}[1]{\ifx\@draft\@undefined #1 \fi}
\newcommand{\ifnotdraftelse}[2]{\ifx\@draft\@undefined #1 \else #2 \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF dependent stuff (inspired by Frank Pählke)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifx\pdftexversion\@undefined % no PDFTeX active
\else
\@usepdftrue % switch automatically to PDF mode
\fi

\if@usepdf
 \usepackage{lmodern}
 \usepackage{color}   % for colorfull hyperlinks
 \usepackage[raiselinks=true,%
             bookmarks=true,%
             bookmarksopenlevel=1,%
             bookmarksopen=true,%
             bookmarksnumbered=true,%
             hyperindex=true,% 
             plainpages=false,% correct hyperlinks
             pdfpagelabels=true,% view TeX pagenumber in PDF reader
             pdfborder={0 0 0.5}]{hyperref} % create Hyperlinks for pdflatex
 \pdfcompresslevel=9   % seems not to work
\else
  \usepackage{nohyperref}
\fi

% \newif\if@usehyperref
% \ifx\href\@undefined % if no hperlink package has been used
% \@usehyperreffalse % hyperref used
% \else
% \@usehyperreftrue % hyperref used
% \fi

%% set pagesize with geometry package
\geometry{left=3cm,right=3cm,top=23mm,bottom=25mm,head=14.5pt}

%% style
\parindent 0cm                     % dont indent first line of paragraph
\parskip1.5ex plus0.5ex minus0.5ex % magrin between two paragraphs

\newcommand{\headfont}{\slshape}
\renewcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% changed headings:
%% pagenumber normal, text in slanted letters and not upper case
%%
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\fancyhf{} % clear all header and footer fields
\fancyfoot[C]{{\thepage}} % left/right header for even/odd pages
\fancyhead[LO]{\headfont\nouppercase{\rightmark}} % header for left side (odd)
\fancyhead[RE]{\headfont\nouppercase{\leftmark}} % right header for even pages
\renewcommand{\headrulewidth}{0.5pt} % head rule
\renewcommand{\footrulewidth}{0pt} % no rule
% plainstyle
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% style for headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\chaptername}{
\vspace{-2cm}
}

\renewcommand{\section}{%
\@startsection{section}%
{1}% Gliederungsebene
{0mm}% Einzug
{1.5ex plus 1ex minus 1.2ex}% Vorabstand
{0.5ex plus 0.5ex minus 0.5ex}% Nachabstand
{\chapterheadfont\Large\bfseries}% Stil
}
\renewcommand{\subsection}{%
\@startsection{subsection}%
{2}%
{0mm}%
{1ex plus 1ex minus 1ex}%
{0.3ex plus 0.3ex minus 0.3ex}%
{\chapterheadfont\large\bfseries}%
}
\renewcommand{\subsubsection}{%
\@startsection{subsubsection}%
{3}%
{0mm}%
{1ex plus 1ex minus 1ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\normalsize\bfseries}%
}
\renewcommand{\paragraph}{%
\@startsection{paragraph}%
{4}%
{0mm}%
{2ex plus 1ex minus 2ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\normalsize\bfseries}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% style of the chapter heading
%% examples : http://zoonek.free.fr/LaTeX/LaTeX_samples_chapter/0.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\chapnolen}
\newlength{\chapparlen}
\newsavebox{\chapno}
%\pagestyle{plain}
\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \chapterheadfont \huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }%
}
% new chapter 
\newcommand{\hsp}{\hspace{20pt}}
\definecolor{gray75}{gray}{0.75}

\makeatletter
\def\@makechapterhead#1{%
  \vspace*{20\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \Huge\bfseries 
        \scshape
        \@chapapp\space \thechapter \hsp\textcolor{gray75}{$|$}\hsp #1
        \par\nobreak
%        \vskip 20\p@
      \fi
    \fi

  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{20\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \scshape
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% index (also for other font families)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{\chapterheadfont #5}}

%% pagestyle for titlepage:
\def\titlehead#1{\def\@titlehead{#1}}
\def\titlefoot#1{\def\@titlefoot{#1}}
\def\@titlehead{}
\def\@titlefoot{}

\def\ps@title{%
\headheight 15mm
\footskip   0cm
\addtolength{\textheight}{-15mm}
\let\@mkboth\@gobbletwo%
  \def\@oddhead{\vbox{\hbox to\textwidth{\@titlehead}
                \vskip 1.5mm
                \hbox to\textwidth{\hrulefill}}}
  \def\@oddfoot{\vbox{\vskip -1mm\hbox to\textwidth{\hrulefill}\vskip 1mm
                \hbox to\textwidth{\@titlefoot}}}
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
}

\renewenvironment{titlepage}
{%
  \let\oldheadheight\headheight
  \let\oldfootskip\footskip
  \let\oldtextheight\textheight
  
   \cleardoublepage
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{title}%
    \setcounter{page}\@ne
}%
{\if@restonecol\twocolumn \else \newpage \fi
 \if@twoside\else
    \setcounter{page}\@ne
 \fi
 \let\headheight\oldheadheight
 \let\textheight\oldtextheight
 \let\footskip\oldfootskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bibliography 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% style of index page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{theindex}
{\if@twocolumn
   \@restonecolfalse
 \else
   \@restonecoltrue
 \fi
 \columnseprule \z@
 \columnsep 35\p@
 \twocolumn[\@makeschapterhead{\indexname}]%
 \@mkboth{\indexname}%
         {\indexname}%
 \addcontentsline{toc}{chapter}{\indexname}%
 \thispagestyle{fancy}
 \flushbottom
 \parindent\z@
 \parskip\z@ \@plus .3\p@\relax
 \let\item\@idxitem
 \def\,{\relax\ifmmode\mskip\thinmuskip
              \else\hskip0.2em\ignorespaces\fi}%
 \raggedright}

%% **** END OF CLASS ****
