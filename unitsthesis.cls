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
\DeclareStringOption{SecondTeacher}
\DeclareStringOption[twoside]{Side}
\DeclareStringOption{Student}
\DeclareStringOption{StudentID}
\DeclareStringOption{Teacher}
\DeclareStringOption{Title}
\DeclareStringOption{Subtitle}

\ProcessKeyvalOptions*


% ========================================
% Class extension
% ========================================

\PassOptionsToClass{\option@Side}{book}
\PassOptionsToClass{\option@FontSize}{book}

\LoadClass{book}


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
% Bibliography
% ========================================

\usepackage[
    backend = biber,
    style = numeric-comp,
    sorting = ynt
]{biblatex}


% ========================================
% Begin and End
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
    \newgeometry{
        hmargin = 3cm,
        vmargin = 2cm
    }
    \begin{titlepage}
        \centering
        \fontsize{12}{16}\selectfont

        \includegraphics[
            height = 3cm,
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
            {\LARGE \option@Title}\\[10pt]
            {\large \option@Subtitle}
        }

        \vfill

        \begin{minipage}[t]{0.3\textwidth}
            \centering
            \textbf{Laureando}\\[5pt]
            \option@Student
            \ifx\option@StudentID\@empty
            \else
                \\
                \option@StudentID
            \fi
        \end{minipage}
        \hspace{0.3\textwidth}
        \begin{minipage}[t]{0.3\textwidth}
            \centering
            \textbf{Relatore}\\[5pt]
            \option@Teacher
            \ifx\option@SecondTeacher\@empty
            \else
                \\[10pt]
                \textbf{Correlatore}\\[5pt]
                \option@SecondTeacher
            \fi
        \end{minipage}

        \vfill

        {\large Anno Accademico 2025/2026}
    \end{titlepage}
    \restoregeometry
    \cleardoublepage

    %
    % Table of contents
    %
    \pagenumbering{roman}
    \tableofcontents
    \cleardoublepage

    \IfFileExists{\jobname.lot}{
        \begingroup
        \endlinechar=-1
        \read\@inputcheck to \@tempa
        \ifeof\@inputcheck\else
            \listoftables
            \cleardoublepage
        \fi
        \endgroup
    }{}

    \IfFileExists{\jobname.lof}{
        \begingroup
        \endlinechar=-1
        \read\@inputcheck to \@tempa
        \ifeof\@inputcheck\else
            \listoffigures
            \cleardoublepage
        \fi
        \endgroup
    }{}

    %
    % Content
    %
    \mainmatter
    \pagestyle{style}
}


\AtEndDocument{
    \printbibliography
}