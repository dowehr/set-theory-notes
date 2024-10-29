\ProvidesClass{whrartcl}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

%% koma-script and lab fonts, basic layout
\LoadClass[a4paper]{scrartcl}
%\LoadClass[a4paper,twoside,DIV=9]{scrartcl}

% Use Lucide fonts if possible, fallback to standard otherwise
% \IfFileExists{lucimatx.sty}
% {\usepackage[scale=0.9]{lucimatx}}
\usepackage[tt=false, type1=true,scale=1.2]{libertine}
\usepackage[varqu]{zi4}
\usepackage[libertine]{newtxmath}

\usepackage{geometry} % brute force
\geometry{
  includehead,% (=> head is part of total body)
  ignorefoot,% (=> foot is not part of total body)
  top=30mm,% (top of paper |---| top of total body)
  totalwidth=150mm,% (width of total body)
  totalheight=215mm% (height of total body)
}
% \linespread{1.04}
\tolerance=2000
\emergencystretch=20pt
\raggedbottom 

\usepackage{titling}
\setlength{\droptitle}{-7em}
\pretitle{\begin{center}\scshape\LARGE}
\posttitle{\par\end{center}\vskip 0.5em}
\preauthor{
    \large \lineskip 0.5em%
    \begin{tabular}[t]{c}}
\postauthor{\end{tabular}\hfill}
\predate{\large}
\postdate{\par}

\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage[amsmath,hyperref,thmmarks]{ntheorem}
\usepackage{mathrsfs}
\usepackage{tikz}
\usetikzlibrary{shapes,arrows,chains,shadows}
\usepackage{mathpartir} % Didier Remy's inference rules, best layout
\renewcommand{\TirName}[1]{\text{\small#1}}
\usepackage{hyperref}
\usepackage{cleveref}

\definecolor{wpurple}{HTML}{9600d0}

\renewcommand{\sectfont}{\scshape}
\renewcommand{\emph}[1]{{\textit{#1}}}
\newcommand{\N}[1]{\ensuremath{{\color{blue}{#1}}}}
\newcommand{\M}[1]{\ensuremath{\mathrm{#1}}}
\newcommand{\mahl}[1]{\emph{#1}\marginpar{#1}}
\newcommand{\mamt}[1]{\marginpar{#1}}

%% enumerate and itemize
\usepackage[neveradjust,flushleft]{paralist}
\renewenvironment{enumerate}{\compactenum}{\endcompactenum}
\renewenvironment{itemize}{\compactitem}{\endcompactitem}
\renewcommand*\descriptionlabel[1]{%
  \hspace\labelsep\scshape #1}
\setlength{\pltopsep}{.5ex}
\setlength{\plitemsep}{.5ex}

%% Left indents
\newlength{\baseindent}
\setlength{\baseindent}{1.5em} %1.2em
\newlength{\itemident}
\setlength{\itemident}{1.1em} %1.2em
\setlength{\parindent}{\baseindent}
\setdefaultleftmargin{\itemident}    % paralist
    {\itemident}{\itemident}{\itemident}
    {\itemident}{\itemident}
\setlength{\@mathmargin}{\baseindent} % amsmath
\setlength{\multlinegap}{\baseindent} % amsmath
\newcommand{\nomathmargin}{\setlength{\@mathmargin}{0em}}
\usepackage{parskip}


%% Theorems
\theoremstyle{plain}
\theoremheaderfont{\scshape\bfseries}
\theorembodyfont{\normalfont}
\newtheorem{lemma}{Lemma}
\newtheorem{fact}[lemma]{Fact}
\newtheorem{proposition}[lemma]{Proposition}
\newtheorem{theorem}[lemma]{Theorem}
\newtheorem{corollary}[lemma]{Corollary}
\newtheorem{conjecture}[lemma]{Conjecture}
\newtheorem{assumption}[lemma]{Assumption}
\newtheorem{exercise}[lemma]{Exercise}
\newtheorem{example}[lemma]{Example}
\newtheorem{claim}[lemma]{Claim}
\theoremsymbol{{\ensuremath{\lrcorner}}}
\newtheorem{definition}[lemma]{Definition}
\theoremsymbol{}
\theoremstyle{nonumberplain}
\newtheorem{remark}{Remark}
\newtheorem{note}{Note}
\newtheorem{observation}{Observation}
\theoremsymbol{{\ensuremath{_\blacksquare}}}
\newtheorem{proof}{Proof}
\newtheorem{solution}{Solution}
\newtheorem{conproof}{Constructive Proof}
\newtheorem{classproof}{Classical Proof}
\newtheorem{proofidea}{Proof Idea}

%% Floats
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{0}
\setcounter{totalnumber}{3}
\renewcommand*{\floatpagefraction}{0.7}
\renewcommand{\@makecaption}[2]{\vskip+3mm\centering%
  {\textsc{#1}: #2}}

%% Samepage
\renewenvironment{samepage}{%
  \trivlist\item\relax\minipage{\textwidth}}{%
  \endminipage\endtrivlist}

%% Proof tree conveniences
\RequirePackage{bussproofs}
\newenvironment{comfproof}{
  \begin{prooftree}
    \EnableBpAbbreviations
  }{
  \end{prooftree}
}
\newenvironment{scprooftree}[1]%
{\gdef\scalefactor{#1}\begin{center}\proofSkipAmount \leavevmode\EnableBpAbbreviations}%
  {\scalebox{\scalefactor}{\DisplayProof}\proofSkipAmount \end{center} }
\newcommand{\LIC}[1]{\LeftLabel{#1}}
\newcommand{\RIC}[1]{\RightLabel{#1}}
\newcommand{\DOC}{\def\extraVskip{-2.5pt} \noLine \UIC{$\vdots$} \def\extraVskip{2pt}}
\newcommand{\LSC}[1]{\LeftLabel{\scriptsize #1}}
\newcommand{\RSC}[1]{\RightLabel{\scriptsize #1}}
