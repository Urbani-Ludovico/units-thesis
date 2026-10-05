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

\DeclareStringOption[12pt]{FontSize}

\ProcessKeyvalOptions*


% ========================================
% Class extension
% ========================================

\PassOptionsToClass{\option@FontSize}{book}

\LoadClass[twoside]{book}