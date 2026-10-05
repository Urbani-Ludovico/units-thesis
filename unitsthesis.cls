\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unitsthesis}[2026/10/01 Latex class for UniTs thesis]


% ========================================
% Options
% ========================================

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=options,
    prefix=option@
}

\DeclareStringOption{Course}
\DeclareStringOption{Department}
\DeclareStringOption{DepartmentCode}
\DeclareStringOption[12pt]{FontSize}
\DeclareStringOption[italian]{Language}
\DeclareStringOption[twoside]{Side}

\ProcessKeyvalOptions*


% ========================================
% Class extension
% ========================================

\PassOptionsToClass{\option@Side}{book}
\PassOptionsToClass{\option@FontSize}{book}

\LoadClass[twoside]{book}


% ========================================
% Page settings
% ========================================

\RequirePackage{geometry}
\geometry{
    a4paper,
    margin = 3cm,
    headheight = 15pt
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage[
	skip = 10pt,
	indent = 0pt
]{parskip}

\RequirePackage{fontspec}
\setmainfont{Latin Modern Roman}

\RequirePackage{hyperref}


% ========================================
% Babel
% ========================================

\RequirePackage[\option@Language]{babel}


% ========================================
% Fancy style
% ========================================

\RequirePackage{fancyhdr}

\fancypagestyle{style}{%
    \fancyhf{}%

    % Even pages
    \fancyhead[LE]{\thepage}%
    \fancyhead[RE]{\nouppercase{\leftmark}}%

    % Odd pages
    \fancyhead[LO]{\nouppercase{\leftmark}}%
    \fancyhead[RO]{\thepage}%

    % Header
    \renewcommand{\headrulewidth}{0.4pt}%

    % Footer
    \fancyfoot{}%
    \renewcommand{\footrulewidth}{0pt}%
}


% ========================================
% Title page
% ========================================

\RequirePackage{graphicx}
\RequirePackage{tabularray}

\AtBeginDocument{
    \frontmatter
    \pagestyle{empty}
    \pagenumbering{gobble}

    %
    % Title page
    %
    \begin{titlepage}
        \centering
        \fontsize{12}{16}\selectfont

        \includegraphics[
            height = 2cm,
            width = \textwidth,
            keepaspectratio
        ]{./unitsthesis.images/departments/\option@DepartmentCode.pdf}\\[20pt]
        \textbf{\large UNIVERSITÀ DEGLI STUDI DI TRIESTE}
        \vspace{20pt}
        \hrule
        \vspace{10pt}
        \MakeUppercase{\option@Department}\\[10pt]
        {\option@Course}\\[50pt]
        {TESI DI LAUREA TRIENNALE}

        \vfill

        \textbf{ 
            {\LARGE Judo: Verso un Tatami più Sicuro}\\[10pt]
            {\large Dinamica e Learning del Controllo a mezzo di un nuovo modello matematico}
        }

        \vfill

        \begin{tblr}{
            width = \textwidth,
            colspec = { X[c] X[c] }
        }
            {\textbf{Laureando} \\[5pt] Ludovico Urbani \\ SM3201372} &
            {\textbf{Relatore} \\[5pt] Prof. Alberto d'Onofrio}
        \end{tblr}

        \vfill

        {\large Anno Accademico 2025/2026}
    \end{titlepage}
    \cleardoublepage

    %
    % Table of contents
    %
    \pagenumbering{roman}
    \tableofcontents
    \cleardoublepage

    %
    % Content
    %
    \mainmatter
    \pagestyle{style}
}