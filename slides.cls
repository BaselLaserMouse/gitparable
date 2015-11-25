% déclarations d'usage
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}[2014/01/20 Classe pour les présentations]

% chargement de beamer
\LoadClass[utf8,hyperref={pdfpagemode=FullScreen},12pt]{beamer}

% option pour l'anglais
\newif\if@english\@englishfalse
\DeclareOption{english}{
  \@englishtrue
}

\ProcessOptions\relax

% prise en compte de l'option anglais
\newcommand{\plantitle}{Plan}
\if@english
  \renewcommand{\plantitle}{Outline}
\fi

% theme pour n'avoir que le numéro de page (copié depuis le thème par défaut)
\defbeamertemplate*{footline}{frame number only}{%
  \hfill%
  \usebeamercolor[fg]{page number in head/foot}%
  \usebeamerfont{page number in head/foot}%
  page \insertframenumber\kern1em\vskip2pt%
}

% thème et réglage de beamer
\usefonttheme[onlylarge]{structurebold}
\setbeamertemplate{section in toc}[circle]
\setbeamercolor{section in toc}{fg=black}
\setbeamerfont{author}{series=\bf}
\setbeamerfont{frametitle}{size=\large,series=\bf}
\setbeamertemplate{itemize item}[circle]
\setbeamertemplate{itemize subitem}[triangle]
\setbeamertemplate{navigation symbols}{} % enlève les symboles de navigation
\setbeamertemplate{footline}[frame number only] % ajoute les numéros de page

% macro pour supprimer une frame du décompte de page et cacher le compteur
\newcommand{\nocount}[1]{
  {\setbeamertemplate{footline}{}#1}
  \addtocounter{framenumber}{-1}
}

% plan au début de chaque section
\AtBeginSection[]{
  \nocount{
    \begin{frame}{\plantitle}
    \tableofcontents[currentsection]
    \end{frame}
  }
}

% macro pour insérer la page de titre et le plan
\renewcommand{\maketitle}{%
  \nocount{
    \frame[plain]{\titlepage}
  }
  
  \nocount{
    \begin{frame}{\plantitle}
      \tableofcontents
    \end{frame}
  }
}

% macro pour insérer 2 colonnes
\newcommand{\twocolumns}[3][0.5]{%
  \begin{columns}[t]
    \begin{column}{#1\textwidth}
      #2
    \end{column}
    \begin{column}{\dimexpr\textwidth-#1\textwidth\relax}
      #3
    \end{column}
  \end{columns}
}
