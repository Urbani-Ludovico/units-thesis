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
\DeclareStringOption[italian]{Language}

\ProcessKeyvalOptions*


% ========================================
% Class extension
% ========================================

\PassOptionsToClass{\option@FontSize}{book}

\LoadClass[twoside]{book}


% ========================================
% Page settings
% ========================================

\RequirePackage{geometry}
\geometry{
    a4paper,
    margin = 0.3cm
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage[
	skip = 10pt,
	indent = 0pt
]{parskip}

\RequirePackage{fontspec}
\setmainfont{Latin Modern Roman}


% ========================================
% Babel
% ========================================

\RequirePackage[\option@Language]{babel}