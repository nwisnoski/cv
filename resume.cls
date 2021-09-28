%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template.
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{hanging}
\pagestyle{plain} % Suppress page numbers
\usepackage{times}
\widowpenalty=1000
\clubpenalty=1000

%-------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%-------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{{\namesize\bf\sc \@name}}\hfil
    \nameskip\break
  \endgroup
}

%-------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%-------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%-------------------------------------------------------------------------------
%	SECTION FORMATTING
%-------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  %\sectionskip
  \MakeUppercase{\sc #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
  }{
  \end{list}
  \vspace{0.25em} % Some space after the list of bullet points
}

%-------------------------------------------------------------------------------
%	HangSECTION FORMATTING
%-------------------------------------------------------------------------------

% Defines the rhangSection environment for the large sections within the CV
% Modified to use hanging indents from https://stackoverflow.com/a/3254474/7317745
\newenvironment{rhangSection}[1]{ % 1 input argument - section name
  %\sectionskip
  \MakeUppercase{\sc #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{2.5em} % Margin within the section
    \setlength{\listparindent}{-1em} %
    \setlength{\itemindent}{-1em} % Hanging indent
    \setlength{\parsep}{\parskip}%
  }
  \item[]
  }{
  \end{list}
  \vspace{0.25em} % Some space after the list of bullet points
}


%-------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%-------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1}
 \ifthenelse{\equal{#2}{}}{}{ % If the second argument is not specified, don't print the year or title or location
 \hfill { #2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {#3} \hfill {\em #4} % Italic job title and location
  }}
  %\begin{list}{}{\leftmargin=0.5em} % \cdot used for bullets, no indentation
  % \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  %}{
  %\end{list}
}

%-------------------------------------------------------------------------------
%	PUBLICATION FORMATTING
%-------------------------------------------------------------------------------

\newenvironment{Prep}[2]{
{#1.} {#2}

}

\newenvironment{Publication}[4]{

 {#1.} {#2.} {#3} {#4.}
}

%-------------------------------------------------------------------------------
%	Presentation FORMATTING
%-------------------------------------------------------------------------------

\newenvironment{Presentation}[5]{
 {#1.} {#2.} {\em #3} {#4.} {#5.}
}


\newenvironment{Seminar}[2]{
 {#1} \hfill {#2}
}

%-------------------------------------------------------------------------------
%	Grant FORMATTING
%-------------------------------------------------------------------------------

% Four args. 1: Agency, 2: Title, 3: PIs, 4: Amount, 5: Years
\newenvironment{Grant}[5]{
\hangpara{3em}{2}
 {#1.} {\em #2} {#3} {#4.} {#5.}
}

%-------------------------------------------------------------------------------
%	Award FORMATTING
%-------------------------------------------------------------------------------

\newenvironment{Award}[3]{
 {#1.} {\em #2} \hfill {#3}
}

%-------------------------------------------------------------------------------
%	year item FORMATTING
%-------------------------------------------------------------------------------

\newenvironment{Item}[2]{
 {#1.} \hfill {#2}
}

%-------------------------------------------------------------------------------
%	Teaching FORMATTING
%-------------------------------------------------------------------------------

% Args: 1: Role, 2: Course name, 3: Institution, 4: year
\newenvironment{Course}[4]{
 {\bf #1.} {#2.} {\em #3.} {#4.}
}


% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section
\def\nameskip{\smallskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section
