%==============================================================================
% Identificação
%==============================================================================
\def\currversion{05/11/2026}

\typeout{^^J^^J
--------------------------------------------------^^J
CLASSE ppgci^^J
Formatação de Documentos LaTeX do PPGCI-UFRGS^^J
--------------------------------------------------^^J
Desenvolvida a partir da Classe iiufrgs e Classe texufpel^^J
por Anderson Martins Wojciechowski e Eduardo Luis Isatto^^J
--------------------------------------------------^^J
Versão: \currversion^^J
--------------------------------------------------^^J^^J}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgci}[\currversion]

%==============================================================================
% Definição de estilo
%==============================================================================

\newcommand{\covertext}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\covertitle}{\fontsize{20pt}{22pt}\selectfont}

% Declaração de opções
%==============================================================================

% \newcommand{\bibliotecario}[1]{\gdef\@nomebibliotecario{#1}}
% \newcommand{\cipdata}[2]{\gdef\@codigocip{#1}\gdef\@codigocdd{#2}}

\newcommand{\universidade}[1]{\gdef\@universidade{#1}}
\newcommand{\universidadeeng}[1]{\gdef\@universidadeeng{#1}}
\universidade{Universidade Federal do Rio Grande do Sul}
\universidadeeng{Federal University of Rio Grande do Sul}

\newcommand{\unidade}[1]{\gdef\@unidade{#1}}
\newcommand{\programa}[1]{\gdef\@programa{#1}}
\newcommand{\nomeprograma}[1]{\gdef\@nomeprograma{#1}} %AMW
\newcommand{\curso}[1]{\gdef\@curso{#1}}
\newcommand{\nomecurso}[1]{\gdef\@nomecurso{#1}}
\newcommand{\titulocurso}[1]{\gdef\@titulocurso{#1}}
\newcommand{\areapesquisa}[1]{\gdef\@areapesquisa{#1}}
\newcommand{\titulo}[1]{\gdef\@title{#1}}
\unidade{Escola de Engenharia}
\programa{Programa de Pós-Gradua\-ção em Engenharia Civil:}
\nomeprograma{Constru\-ção e Infraestrutura}
\curso{Engenharia Civil}

\newcommand{\unidadeeng}[1]{\gdef\@unidadeeng{#1}}
\newcommand{\programaeng}[1]{\gdef\@programaeng{#1}}
\newcommand{\nomeprogramaeng}[1]{\gdef\@nomeprogramaeng{#1}} %AMW
\newcommand{\cursoeng}[1]{\gdef\@cursoeng{#1}}
\newcommand{\areapesquisaeng}[1]{\gdef\@areapesquisaeng{#1}}
\newcommand{\tituloeng}[1]{\gdef\@titleeng{#1}}
\unidadeeng{School of Engineering}
\programaeng{Postgraduate Program in Civil Engineering:}
\nomeprogramaeng{Construction and Infrastructure}
\cursoeng{Civil Engineering}

\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\disciplina}[1]{\gdef\@disciplina{#1}}
\newcommand{\coordenador}[1]{\gdef\@coordenador{#1}}
\newcommand{\documento}[1]{\gdef\@documento{#1}}
\newcommand{\tipodocumento}[1]{\gdef\@tipodocumento{#1}}
\newcommand{\descricaodocumento}[1]{\gdef\@descricaodocumento{#1}}
\newcommand{\descricaoaprovacao}[1]{\gdef\@descricaoaprovacao{#1}}

%==============================================================================
% Declaração de Variáveis (FLAGS) AMW
%==============================================================================

\newif\ifarial
\newif\iftimes
\arialfalse
\timesfalse

%==============================================================================
% Declaração de Todas as Opções 
%==============================================================================

\DeclareOption{eq}{
\documento{\covertext\selectfont  Exame de Qualifica{\c{c}}{\~a}o}
\tipodocumento{\eqname\ (\masterin\ \cursoname) -- \unidadename}
\descricaodocumento{\eqdesc}
\descricaoaprovacao{\eqaprov}}

\DeclareOption{diss}{
\documento{\covertext\selectfont Disserta{\c{c}}{\~a}o} 
\tipodocumento{\dissname\ (\masterin\ \cursoname) -- \unidadename}
\descricaodocumento{\covertext\selectfont \dissdesc}
\descricaoaprovacao{\dissaprov}}

\DeclareOption{eqd}{
\documento{\covertext\selectfont  Exame de Qualifica{\c{c}}{\~a}o}
\tipodocumento{\eqname\ (\doctoratein\ \cursoname) -- \unidadename}
\descricaodocumento{\eqddesc}
\descricaoaprovacao{\eqdaprov}}

\DeclareOption{tese}{
\documento{\covertext\selectfont Tese}
\tipodocumento{\thesisname\ (\doctoratein\ \cursoname) -- \unidadename}
\descricaodocumento{\thesisdesc}
\descricaoaprovacao{\thesisaprov}}

\DeclareOption{ti}{
\tipodocumento{\covertext\selectfont Trabalho Individual -- \@unidade}
\descricaodocumento{\tidesc}
}

\newcommand{\capa}[1]{\gdef\@capa{#1}}
\DeclareOption{capa}{\capa{1}}

\newcommand{\nocipinfo}[1]{\gdef\@nocipinfo{#1}}
\DeclareOption{nocipinfo}{\nocipinfo{1}}

\DeclareOption{arial}{\arialtrue\timesfalse}
\DeclareOption{times}{\timestrue\arialfalse}
\newif\if@english
\DeclareOption{english}{\@englishtrue\OptionNotUsed}
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================
\LoadClass[12pt,a4paper,twoside]{report} %AMW oneside
\setlength{\parindent}{0pt}

\RequirePackage{iftex}   %AMW detecta o compilador
\ifPDFTeX
  \RequirePackage[utf8]{inputenc} %AMW  acentuação, venho pra cls para ajuste de ordem
  \RequirePackage[T1]{fontenc}  %AMW codificação de fonte, venho pra cls para ajuste de ordem
\else
  \RequirePackage{fontspec}  %AMW codificação de fonte, venho pra cls para ajuste de ordem
\fi
\RequirePackage[english,brazilian]{babel}
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
%\RequirePackage{natbib} %é sistema de citações do BibTeX ISATTO
\RequirePackage{csquotes} %aspas automáticas corretas por idioma %ISATTO
\RequirePackage[
    style=abnt,
    backend=biber, %Motor de processamento (requer Biber)
    giveninits=true, %(Opcional) Abrevia os prenomes nas referências
    uniquename=init %diferencia autores com o mesmo sobrenome
]{biblatex} %Configuração do BibLaTeX (ABNT)
\RequirePackage{chngcntr}
\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{setspace}
\RequirePackage{geometry} % permite ajustar as margens, se necessário
\RequirePackage{changepage}
\RequirePackage{background} %AMW
\RequirePackage{ragged2e} %AMW
\RequirePackage{fancyhdr} %AMW
\RequirePackage{graphicx} %AMW venho pra cls pois a capa usa
\RequirePackage{array}    %AMW venho pra cls pois a classe usa nas tabelas da capa
\RequirePackage{hyperref}
\RequirePackage{bookmark} %AMW otimizada do sistema de "bookmarks"
\backgroundsetup{contents={}}

\RequirePackage[singlelinecheck=on, skip=2pt, font=small, justification=centering, format=plain, labelsep=endash]{caption}

\DeclareCaptionListFormat{figuracf}{\figurename\ #1#2}
\DeclareCaptionListFormat{tabelacf}{\tablename\ #1#2}
\DeclareCaptionListFormat{quadrocf}{\quadroname\ #1#2} %Formatação da lista de quadros AMW/Marilton
\captionsetup[figure]{position=bottom,listformat=figuracf}
\captionsetup[table]{position=top,listformat=tabelacf}
\captionsetup[quadro]{position=bottom,listformat=quadrocf} 

\geometry{top=3cm,right=2cm,left=3cm,bottom=2cm}

\newcolumntype{x}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{j}[1]{>{\justifying\arraybackslash}p{#1}}

\DeclareLabelname{% %AMW declara o uso de shortauthor como rótulo de citação
  \field{shortauthor}
  \field{author}
}

%
% definições para textos em português
%
\@namedef{captionsbrazilian}{%
    \def\titlename{\@title}%
    \def\bibname{Refer{\^e}ncias}%
    \def\abstractname{Resumo}%
    \def\appendixname{Ap{\^e}ndice}%
    \def\contentsname{Sum{\'a}rio}%
    \def\listfigurename{Lista de Figuras}%
    \def\listtablename{Lista de Tabelas}%
    \def\listquadroname{Lista de Quadros}%
    \def\figurename{Figura}%
    \def\tablename{Tabela}%
    \def\quadroname{Quadro}%
    \def\advisorname{Orientador}%
    \def\coadvisorname{Coorientador}%
    \def\collaboratorname{Colaborador}%
    \def\professorname{Docente da Disciplina}%
    \def\docentename{Docente}%
    \def\listabbrvname{Lista de Abreviaturas e Siglas}%
    \def\listsymbolname{Lista de S{\'\i}mbolos}%
    \def\annexname{Anexo}%
    \def\keywordsname{Palavras-chave}%
    \def\acknowledgmentsname{Agradecimento}%
    \def\tccname{Trabalho de Conclus\~ao de Curso}%
    \def\thesisname{Tese}%
    \def\eqname{Exame de Qualifica{\c{c}}{\~a}o}%
    \def\doctoratein{Doutorado em}%
    \def\dissname{Disserta{\c{c}}{\~a}o}%
    \def\masterin{Mestrado em}%
    \def\examinersname{Banca Examinadora}%
    \def\coordinatorname{Coordenador}%
    \def\universidadename{\@universidade}%
    \def\unidadename{\@unidade}%
    \def\programaname{\@programa}%
    \def\cursoname{\@curso}%
    \def\eqdesc{\covertext\selectfont Qualifica{\c{c}}{\~a}o de Mestrado apresentada ao \@programa\ \@nomeprograma\ da \@universidade, como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
    \def\eqaprov{Esta Qualifica{\c{c}}{\~a}o de Mestrado foi julgada como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de MESTRE EM {\MakeUppercase\@curso}, \'area de pesquisa \@areapesquisa, e aprovada em sua forma final pelo Professor Orientador e pelo  \@programa\ \@nomeprograma\ da \@universidade.}
    \def\dissdesc{\covertext\selectfont Disserta{\c{c}}{\~a}o de Mestrado apresentada ao \@programa\ \@nomeprograma\ da \@universidade, como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de Mestre em \@curso.}
    \def\dissaprov{Esta Disserta{\c{c}}{\~a}o de Mestrado foi julgada como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de MESTRE EM {\MakeUppercase\@curso}, \'area de pesquisa \@areapesquisa, e aprovada em sua forma final pelo Professor Orientador e pelo  \@programa\ \@nomeprograma\ da \@universidade.}
    \def\eqddesc{\covertext\selectfont Qualifica{\c{c}}{\~a}o de Doutorado apresentada ao \@programa\ \@nomeprograma\ da \@universidade, como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
    \def\eqdaprov{Esta Qualifica{\c{c}}{\~a}o de Doutorado foi julgada como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de DOUTOR EM {\MakeUppercase\@curso}, \'area de pesquisa \@areapesquisa, e aprovada em sua forma final pelo Professor Orientador e pelo  \@programa\ \@nomeprograma\ da \@universidade.}
    \def\thesisdesc{\covertext\selectfont Tese de Doutorado apresentada ao \@programa\ \@nomeprograma\ da \@universidade, como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de Doutor em \@curso.}
    \def\thesisaprov{Esta Tese de Doutorado foi julgada como parte dos requisitos para obten{\c{c}}{\~a}o do t\'itulo de DOUTOR EM {\MakeUppercase\@curso}, \'area de pesquisa \@areapesquisa, e aprovada em sua forma final pelo Professor Orientador e pelo  \@programa\ \@nomeprograma\ da \@universidade.}
    \def\tidesc{\covertext\selectfont Trabalho apresentado ao \@programa\ \@nomeprograma\ da \@universidade, como requisito parcial para aprova{\c{c}}{\~a}o na disciplina \@disciplina.}
}
    
\@namedef{datebrazilian}{%
    \def\monthname{%
        \ifcase\month\or%
        janeiro\or fevereiro\or mar{\c{c}}o\or abril\or maio\or junho\or
        julho\or agosto\or setembro\or outubro\or novembro\or dezembro%
        \fi%
    }%
    \def\ei@date{\@publyear}%
    % \def\ei@date{\@publmonth\ de~\@publyear}%
}

%
% definições para textos em inglês
%
\@namedef{captionsenglish}{%
    \def\titlename{\@titleeng}%
    \def\bibname{References}%
    \def\abstractname{Abstract}%
    \def\appendixname{Appendix}%
    \def\contentsname{Contents}%
    \def\listfigurename{List of Figures}%
    \def\listtablename{List of Tables}%
    \def\figurename{Figure}%
    \def\tablename{Table}%
    \def\advisorname{Supervisor}%
    \def\coadvisorname{Co-supervisor}%
    \def\collaboratorname{Collaborator}%
    \def\professorname{Graduate Course Instructor}%
    \def\docentename{Graduate Course Instructor}%
    \def\listabbrvname{List of Acronyms}%
    \def\listsymbolname{List of Symbols}%
    \def\annexname{Annex}%
    \def\keywordsname{Keywords}%
    \def\acknowledgmentsname{Acknowledgments}%
    \def\tccname{Undergraduate Thesis}%
    \def\eqname{Qualification Exam}%
    \def\thesisname{Thesis}%
    \def\doctoratein{Doctorate in}%
    \def\dissname{Dissertation}%
    \def\masterin{Masters in}%
    \def\examinersname{Examiners}%
    \def\coordinatorname{Coordinator}%
    \def\universidadename{\@universidadeeng}%
    \def\unidadename{\@unidadeeng}%
    \def\programaname{\@programaeng}%
    \def\cursoname{\@cursoeng}%
    \def\eqdesc{\covertext\selectfont Master Qualification presented to the \@programaeng\ \@nomeprogramaeng\ at the \@universidade,  as part of the requirements for obtaining the title of Master in \@cursoeng.}
    \def\eqaprov{This Master Qualification was judged as part of the requirements for obtaining the title of MASTER IN {\MakeUppercase\@cursoeng}, research area \@areapesquisaeng, and approved in its final form by the Supervisor Professor and the \@programaeng\ \@nomeprogramaeng\ at the \@universidade.}
    \def\dissdesc{\covertext\selectfont Master Dissertation presented to the \@programaeng\ \@nomeprogramaeng\ at the \@universidade,  as part of the requirements for obtaining the title of Master in \@cursoeng.}
    \def\dissaprov{This Master Dissertation was judged as part of the requirements for obtaining the title of MASTER IN {\MakeUppercase\@cursoeng}, research area \@areapesquisaeng, and approved in its final form by the Supervisor Professor and the \@programaeng\ \@nomeprogramaeng\ at the \@universidade.}
    \def\eqddesc{\covertext\selectfont Doctoral Qualification presented to the \@programaeng\ \@nomeprogramaeng\ at the \@universidade,  as part of the requirements for obtaining the title of Doctor in \@cursoeng.}  
    \def\eqdaprov{This Doctoral Qualification was judged as part of the requirements for obtaining the title of DOCTOR IN {\MakeUppercase\@cursoeng}, research area \@areapesquisaeng, and approved in its final form by the Supervisor Professor and the \@programaeng\ \@nomeprogramaeng\ at the \@universidade.}
    \def\thesisdesc{\covertext\selectfont Doctoral Thesis presented to the \@programaeng\ \@nomeprogramaeng\ at the \@universidade,  as part of the requirements for obtaining the title of Doctor in \@cursoeng.}
    \def\thesisaprov{This Doctoral Thesis was judged as part of the requirements for obtaining the title of DOCTOR IN {\MakeUppercase\@cursoeng}, research area \@areapesquisaeng, and approved in its final form by the Supervisor Professor and the \@programaeng\ \@nomeprogramaeng\ at the \@universidade.}  
}
    
\@namedef{dateenglish}{%
    \def\monthname{%
        \ifcase\month\or%
        January\or February\or March\or April\or May\or June\or July\or
        August\or September\or October\or November\or December%
        \fi%
      }%
    \def\ei@date{\@publyear}%
    % \def\ei@date{\@publmonth~\@publyear}%
}

\if@english%
\selectlanguage{english}%
\AtBeginDocument{\selectlanguage{english}}%
\fi

%==============================================================================
% Escolha de fonte padrão (ABNT) MODIFICADO AMW
%==============================================================================

\ifarial %foi editado para simplificar ISATTO
    \ifPDFTeX
        \RequirePackage[helvet]{sfmath} % opcional: para matemática em sans-serif
        \RequirePackage{helvet}
        \renewcommand{\familydefault}{\sfdefault}
    \else
        \RequirePackage{fontspec}
        \setmainfont{Arial}
        \setsansfont{Arial}
        \renewcommand{\familydefault}{\sfdefault}
    \fi
\else
    % Se não for Arial, o padrão é Times (seja via opção times ou omitida)
    \ifPDFTeX
        \RequirePackage{newtxtext,newtxmath}
    \else
        \RequirePackage{fontspec}
        \setmainfont{Times New Roman}
    \fi
\fi

%==============================================================================
% Numeração das páginas e rodapé MODIFICADO AMW
%==============================================================================
\def\ps@texppgci{%
    \def\@oddfoot{%
        \vbox{%
            \hrule height 0.4pt%
            \vskip 2mm%
            \hbox to \textwidth{%
                \hfil{\fontsize{10pt}{12pt}\selectfont \titlename}\hfil%
        }%
    }%
  }%
    \def\@evenfoot{%
        \vbox{%
            \hrule height 0.4pt%
            \vskip 2mm%
            \hbox to \textwidth{%
                \hfil{\fontsize{10pt}{12pt}\selectfont \@authora~(\@email). \@city: UFRGS/EE/PPGCI, \@publyear}\hfil%
        }%
    }%
  }%
    \def\@oddhead{\hspace*{\fill}{\small\thepage}}%
    \def\@evenhead{\hspace*{\fill}{\small\thepage}}% 
} 

\pagestyle{empty}%
\let\ps@plain\ps@empty

%==============================================================================
% Definição de autor(es), orientador e co-orientador MODIFICADO AMW
%==============================================================================
\newcounter{ei@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ei@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ei@authorcount}\endcsname{#2 #1}
}

\newcounter{ei@advisorcount}
\DeclareRobustCommand{\advisor}[4][]{
        \addtocounter{ei@advisorcount}{1}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}info\endcsname{#4}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}\endcsname{\textbf{#1~#3 #2}\par
        #4\par
        \advisorname}
}

\newcounter{ei@coadvisorcount}
\DeclareRobustCommand{\coadvisor}[4][]{
        \addtocounter{ei@coadvisorcount}{1}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}info\endcsname{#4}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}\endcsname{\textbf{#1~#3 #2}\par
        #4\par
        \coadvisorname}
}

\newcounter{ei@professorcount}
\DeclareRobustCommand{\professor}[4][]{
        \addtocounter{ei@professorcount}{1}
        \expandafter\gdef\csname @professor\alph{ei@professorcount}last\endcsname{#2}
        \expandafter\gdef\csname @professor\alph{ei@professorcount}first\endcsname{#3}
        \expandafter\gdef\csname @professor\alph{ei@professorcount}info\endcsname{#4}
        \expandafter\gdef\csname @professor\alph{ei@professorcount}\endcsname{\textbf{#1~#3 #2}\par
        #4\par
        \professorname}
}

%==============================================================================
% Definição das palavras-chave (máx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}

\newcounter{kwcountereng}
\newcommand{\keywordeng}[1]{
        \addtocounter{kwcountereng}{1}
        \expandafter\gdef\csname keyweng\alph{kwcountereng}\endcsname{#1}
}

\newcommand{\@cipkw}{%
       \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
       \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
       \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
       \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
       \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
       \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
       \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
       \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
       \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
       \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}

\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter \keywa}%
        \@ifundefined{keywb}{}{ \keywb}%
        \@ifundefined{keywc}{}{ \keywc}%
        \@ifundefined{keywd}{}{ \keywd}%
        \@ifundefined{keywe}{}{ \keywe}%
        \@ifundefined{keywf}{}{ \keywf}%
        \@ifundefined{keywg}{}{ \keywg}%
        \@ifundefined{keywh}{}{ \keywh}%
        \@ifundefined{keywi}{}{ \keywi}%
        \@ifundefined{keywj}{}{ \keywj}%
}

\newcommand{\@abstractkweng}{%
        \@ifundefined{keywenga}{}{\expandafter \keywenga}%
        \@ifundefined{keywengb}{}{ \keywengb}%
        \@ifundefined{keywengc}{}{ \keywengc}%
        \@ifundefined{keywengd}{}{ \keywengd}%
        \@ifundefined{keywenge}{}{ \keywenge}%
        \@ifundefined{keywengf}{}{ \keywengf}%
        \@ifundefined{keywengg}{}{ \keywengg}%
        \@ifundefined{keywengh}{}{ \keywengh}%
        \@ifundefined{keywengi}{}{ \keywengi}%
        \@ifundefined{keywengj}{}{ \keywengj}%
}

%==============================================================================
% Redefinição da data (para ter mês e ano separados)
%==============================================================================
\newcommand{\pubdate}[2]{%
    \gdef\@publmonth{#1}%
    \gdef\@publyear{#2}%
}

\pubdate{\monthname}{\number\year}

%==============================================================================
% Definição padrão da folha de rosto. MODIFICADO AMW
% Os dados específicos do tipo de trabalho (dissertação, tese, etc.) são
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def incluídos com a classe.
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}

\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}

\location{Porto Alegre}{RS}

\newcommand{\CoverBackground}{ % %AMW
    \backgroundsetup{
        scale=1,
        angle=0,
        opacity=1,
        placement=top,
        contents={%
            \includegraphics[width=\paperwidth,height=\paperheight]{Figuras/capamodelo.png}
    }
}
}
\newcommand{\ClearCoverBackground}{
\backgroundsetup{contents={}}
}

\renewcommand{\maketitle}{ %
    \@ifundefined{@capa}{%
\begin{titlepage}
    \thetitlepage
\end{titlepage}
\clearpage
%\setcounter{page}{1}
}{%

\begin{titlepage}
    \CoverBackground
    \thecoverpage
    \newpage
%remove o fundo
    \ClearCoverBackground
%folha de rosto
    \thetitlepage
\end{titlepage}
\clearpage
\setcounter{page}{3}
}
}

%==============================================================================
% Capa
%==============================================================================
\newcommand{\thecoverpage}{% %AMW

    \onehalfspacing%
    \noindent
    {\covertext\selectfont \@universidade}\\
    {\covertext\selectfont \@unidade}\\
    {\covertext\selectfont \@programa}\\
    \@ifundefined{@nomeprograma}{}{%
    {\covertext\selectfont \@nomeprograma}\\
    }%
    \vspace*{2cm}

    \noindent
    {\covertext\selectfont\Large \@authora}
    \vspace*{4cm}

    \noindent
    \begin{minipage}{0.8\textwidth}
        \raggedright
        \bfseries\covertitle\selectfont \titlename
    \end{minipage}
    \vfill
    \noindent
    {\covertext\selectfont \@city}
    \par
    \noindent
    {\covertext\selectfont \ei@date}
    \vspace*{1cm}
}

%==============================================================================
% Folha de Rosto
%==============================================================================

\newcommand{\thetitlepage}{%
\noindent%
    \centering%
        {\covertext\selectfont{\MakeUppercase\@authora}}\\
        \@ifundefined{@authorb}{}{\covertext\selectfont{\MakeUppercase{\@authorb}}\\}%
        \@ifundefined{@authorc}{}{\covertext\selectfont{\MakeUppercase{\@authorc}}\\}%
        \@ifundefined{@authord}{}{\covertext\selectfont{\MakeUppercase{\@authord}}\\}%
        \vskip 4.23cm%
        {\covertext\selectfont\textbf{\MakeUppercase{\titlename}}}%
    \vskip 3.39cm%
        \singlespacing%
      \begin{adjustwidth}{2.5cm}{0cm}
    %        \begin{hyphenrules}{nohyphenation}%
            \raggedleft 
            \hyphenpenalty=10000
            \exhyphenpenalty=10000
            \@descricaodocumento%
     %     	\end{hyphenrules}%
      \end{adjustwidth}

\vspace*{30pt}%
\@ifundefined{@advisora}{}{%
\centering%
\noindent
\hfill
    \begin{tabular}
        {>{\raggedleft\arraybackslash}p{.48\textwidth}
         >{\raggedleft\arraybackslash}p{.48\textwidth}}
         
        \@ifundefined{@advisorb}{%
          \@ifundefined{@coadvisora}{}{%
            \@advisora
          }%
        }{%
          \@advisora
        }%
        &
        \@ifundefined{@advisorb}{%
          \@ifundefined{@coadvisora}{%
            \@advisora
          }{%
            \@coadvisora
          }%
        }{%
          \@advisorb
        }%
        \\[40pt]

        \@ifundefined{@advisorb}{%
          \mbox{}%
        }{%
          \@ifundefined{@coadvisorb}{%
            \mbox{}%
          }{%
            \@coadvisora%
          }%
        }%
        &
        \@ifundefined{@coadvisorb}{%
          \@ifundefined{@advisorb}{%
            \mbox{}%
          }{%
            \@ifundefined{@coadvisora}{\mbox{}}{\@coadvisora}%
          }%
        }{%
          \@coadvisorb%
        }
        \\
    \end{tabular}
  }%

\vspace*{20pt}%
\@ifundefined{@professora}{}{%
\centering%
\noindent
\hfill
    \begin{tabular}
        {>{\raggedleft\arraybackslash}p{.48\textwidth}
         >{\raggedleft\arraybackslash}p{.48\textwidth}}

        \mbox{} 
        &
        \@ifundefined{@professorb}{%
            \textbf{\MakeUppercase{\docentename}}%
        }{%
            \textbf{\MakeUppercase{\docentename s}}%
        }%
        \\[10pt]
    
        \@ifundefined{@professorb}{}{%
            \@professora
        }%
        &
        \@ifundefined{@professorb}{%
            \@professora
        }{%
            \@professorb
        }%
        \\ [40pt]

        \@ifundefined{@professorc}{%
          \mbox{}%
        }{%
          \@ifundefined{@professord}{%
            \mbox{}%
          }{%
            \@professorc%
          }%
        }%
        &
        \@ifundefined{@professord}{%
          \@ifundefined{@professorc}{%
            \mbox{}%
          }{%
            \@professorc%
          }%
        }{%
          \@professord%
        }
        \\     
\end{tabular}
}%

\vfill%   
\centerline{\@city, \ei@date}%
}

%==============================================================================
% Ajuste do sumário (nada indentado) 
%==============================================================================
\newlength{\ei@chapnumindent}\setlength{\ei@chapnumindent}{1.8em}

\renewcommand*{\l@chapter}[2]{
        \addpenalty{-\@highpenalty}
        \vskip -1ex \@plus\p@
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode\bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        \@dottedtocline{0}{0em}{\ei@chapnumindent}{\fontsize{14}{18}\selectfont\MakeUppercase{#1}}{#2}
        \penalty\@highpenalty
        \endgroup
}
\renewcommand*{\l@section}[2]
              {\@dottedtocline{1}{0em}{2.8em}{\fontsize{14}{18}\selectfont\MakeUppercase{#1}}{\hss #2}}
\renewcommand*{\l@subsection} [2]
              {\@dottedtocline{2}{0em}{3.7em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsubsection} 
              {\@dottedtocline{2}{0em}{3.7em}}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Definição das listas de abreviaturas e siglas e de símbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
    \chapter*{\listabbrvname}
    \begin{list}{\textbf{??}}{%
        \settowidth{\labelwidth}{#1}%
        \setlength{\labelsep}{1em}%
        \setlength{\itemindent}{0mm}%
        \setlength{\leftmargin}{\labelwidth}%
        \addtolength{\leftmargin}{\labelsep}%
        \setlength{\rightmargin}{0mm}%
        \setlength{\itemsep}{.1\baselineskip}%
        \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}%
    }
}{
\end{list}
} 

\newenvironment{listofsymbols}[1]{
    \chapter*{\listsymbolname}
    \begin{list}{\textbf{??}}{%
        \settowidth{\labelwidth}{#1}%
        \setlength{\labelsep}{1em}%
        \setlength{\itemindent}{0mm}%
        \setlength{\leftmargin}{\labelwidth}%
        \addtolength{\leftmargin}{\labelsep}%
        \setlength{\rightmargin}{0mm}%
        \setlength{\itemsep}{.1\baselineskip}%
        \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}%
    }
}{
\end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==============================================================================

%flag para mostrar resumo em português
\newif\ifshowabstractpt
\showabstractpttrue % padrão: mostra resumo em português

%se o documento for em inglês, desliga o resumo em português por padrão
\if@english
    \showabstractptfalse
\fi

%comando manual para forçar mostrar resumo em português
\newcommand{\forcabrabstract}{\showabstractpttrue}


%ambiente resumo (sempre português)
\renewenvironment{abstract}{%
    \begin{otherlanguage}{brazilian} % força idioma português
    \chapter*{\abstractname}
    \@ifundefined{@nocipinfo}{
        \noindent{\MakeUppercase{\@authoralast},
        \@authorafirst. \textbf{\@title}. \advisorname: \@advisorafirst\ \@advisoralast. \@publyear. \pageref{LastPage}~f. \@tipodocumento,
        \universidadename, \@city, \@publyear.}\\~\\
    }{}
}{%
    \par\vfill
    \noindent\keywordsname: \@abstractkw
\end{otherlanguage} % fecha o idioma português
}

%ambiente abstract (sempre inglês)
\newenvironment{englishabstract}[1]{%
    \if@openright\cleardoublepage\else\clearpage\fi%
    \gdef\@englishtitle{#1}%
    \begin{otherlanguage}{english} % força idioma inglês
    \chapter*{\abstractname}
    \@ifundefined{@nocipinfo}{
        \noindent{\MakeUppercase{\@authoralast},
        \@authorafirst. \textbf{\@titleeng}. \advisorname: \@advisorafirst\ \@advisoralast. \@publyear. \pageref{LastPage}~f. \@tipodocumento,
        \universidadename, \@city, \@publyear.}\\~\\
    }{}
}{%
    \par\vfill
    \noindent\keywordsname: \@abstractkweng
\end{otherlanguage} % fecha o idioma inglês
}

%==============================================================================
% Formatação dos capítulos. MODIFICADO AMW
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta (deve aparecer somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos.
%==============================================================================
\newcommand{\ei@chapterfont}{\@setfontsize\Large{14}{18}}
\def\@chapapp{}

\def\@chapter[#1]#2{%
        \onehalfspacing
    \refstepcounter{chapter}%
    \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}%
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \addtocontents{loq}{\protect\addvspace{10\p@}}%
    \pagestyle{texppgci}\let\ps@plain\ps@texppgci%
    \@makechapterhead{#2}\@afterheading%
}

\def\@makechapterhead#1{%
    \vspace*{36pt}%
    \reset@font\noindent{\ei@chapterfont\bfseries\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}\par}%
    \addvspace{24pt}% %removi o \thispagestyle{empty} AMW
}

\def\@schapter#1{%
    \if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi%
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \addtocontents{loq}{\protect\addvspace{10\p@}}%
    \@makeschapterhead{#1}\@afterheading%
}

\def\@makeschapterhead#1{%
    \vspace*{0pt}%
    \reset@font\centerline{\ei@chapterfont\bfseries\MakeUppercase{#1}}%
    \addvspace{24pt}% %removi o \thispagestyle{empty} AMW
}

\renewcommand{\appendix}[1][\appendixname]{%
    \setcounter{chapter}{0}%
    \renewcommand{\thechapter}{\Alph{chapter}}%
    \setcounter{tocdepth}{0}%
    \@captionlistingfalse%
    \gdef\@chapapp{\MakeUppercase{#1}\space}%
    \addtocontents{toc}{%
        \protect \settowidth{\ei@chapnumindent}{{\bfseries\@chapapp}}%
        \addtolength{\ei@chapnumindent}{2.85em}%
    }%
}

\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções MODIFICADO AMW
%==============================================================================
\setcounter{secnumdepth}{4} 

\renewcommand{\section}{%
    \@startsection{section}{1}{0pt}{24pt}{12pt}{\reset@font\fontsize{14}{18}\selectfont\MakeUppercase}
} 

\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{0pt}{12pt}{3pt}{\reset@font\bfseries}
} 

\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}{3}{0pt}{6pt}{6pt}{\reset@font}
} 

\renewcommand{\paragraph}{%
    \@startsection{paragraph}{4}{0pt}{0pt}{12pt}{\reset@font} 
}

\renewcommand{\subparagraph}{%
    \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Formatação das legendas 
%==============================================================================
\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\thetable}{\@arabic\c@table}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}

%==============================================================================
% Quadros
%==============================================================================
\RequirePackage{newfloat}  %inserir quadro - AMW/Marilton

\DeclareFloatingEnvironment[
    fileext=loq,
    listname={Lista de Quadros},
    name={Quadro},
    placement=ht,
    %within=chapter,
    %legendname=Quadro,
    %autorefname=Quadro,
]{quadro}

% Numeração contínua dos quadros
\counterwithout{quadro}{chapter}

% Exibe a lista somente em português
\let\listofquadrosoriginal\listofquadros

\renewcommand{\listofquadros}{%
    \if@english
        % Não gera a lista em inglês
    \else
        \listofquadrosoriginal
    \fi
}

%==============================================================================
% Redefinição do conteúdo das listas de figuras, tabelas e quadros MODIFICADO AMW
%==============================================================================

\newif\if@captionlisting\@captionlistingtrue

\long\def\@caption#1[#2]#3{%
    \par
    \if@captionlisting%
        \addcontentsline{\csname ext@#1\endcsname}{#1}%
            {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%
    \fi%
    \begingroup
        \@parboxrestore
        \if@minipage
            \@setminipage
        \fi
        \normalsize
        \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
    \endgroup%
}

\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure
\let\l@quadro\l@figure

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
\renewenvironment{quote}{%
    \small%
    \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
}{%
\end{list}
}

%==============================================================================
% Ajuste do formato das citações e referências
%==============================================================================
\setlength{\bibhang}{0pt}
%\let\cite\citep  %é sistema de citações do BibTeX ISATTO

% \renewcommand{\NAT@nmfmt}[1]{%
%   \ifNAT@swa\expandafter\MakeUppercase\else\expandafter\@firstofone\fi{{\NAT@up #1}}%
% }

%apêndices
\newcommand{\apendices}{
    \clearpage
    \pagestyle{empty}
    \mbox{}
    \vfill
    \begin{center}
        \textbf{\appendixname}
    \end{center}
    \vfill
    \appendix
    \titleformat{\chapter}{\centering\normalfont}{\chaptertitlename\ \thechapter\ --\ }{0em}{}
}

%anexos
\newcommand{\anexos}{
    \clearpage
    \pagestyle{empty}
    \mbox{}
    \vfill
    \begin{center}
        \textbf{\annexname}
    \end{center}
    \vfill
    \annex
    \titleformat{\chapter}{\centering\normalfont}{\chaptertitlename\ \thechapter\ --\ }{0em}{}
}

%ficha catalográfica 
\newcommand{\fichacatalografica}{
    \clearpage
	\mbox{}
	\vfill
	\begin{center}
		\textbf{Insira AQUI a ficha catalogr\'afica\\Quando finalizado o trabalho, deve ser\\solicitada através do Sistema para Geração \\Automática de Ficha Catalográfica\\https://www.ufrgs.br/bibliotecas/ferramentas/\#ficha}
	\end{center}
	\vfill
}

%agradecimentos
\newenvironment{agradecimentos}{
    \chapter*{\acknowledgmentsname}
}{
}

%dedicatória
\newenvironment{dedicatoria}{
    \clearpage
    \onehalfspacing
    \normalfont
    \mbox{}
    \vfill
    \begin{flushright}
}{
    \end{flushright}
}

%epígrafe
\newcommand{\epigrafetexto}[1]{%
    ``#1''%
}
\newcommand{\epigrafeautor}[1]{%
    \\{\itshape (#1)}%
}

\newenvironment{epigrafe}{
    \clearpage
    \onehalfspacing
    \normalfont
    \mbox{}
    \vfill
    \begin{flushright}
}{
    \end{flushright}
}

%data em português
\newcommand{\datadefesaPT}[3]{%
    \begingroup
    \month=#2\relax
    #1 de \monthname{} de #3%
    \endgroup
}

%data em inglês
\newcommand{\datadefesaEN}[3]{%
    \begingroup
    \month=#2\relax
    \monthname{} #1, #3%
    \endgroup
}

%nominata da banca
\newenvironment{aprovacao}[3]{%
	\clearpage
	\onehalfspacing
    \begin{center}
		\noindent\covertext\selectfont{\MakeUppercase\@authora}\\
		\vskip 1.27cm        \noindent\covertext\selectfont\textbf{\MakeUppercase{\titlename}}\\
		\vskip 1.27cm
		\noindent\parbox[b]{16cm}{
            \centering
            \normalsize
    		\begin{hyphenrules}{nohyphenation}
    		      \@descricaoaprovacao
    		\end{hyphenrules}
		}
        \noindent \normalsize Porto Alegre, %
            \if@english
                \datadefesaEN{#1}{#2}{#3}%
            \else
                \datadefesaPT{#1}{#2}{#3}%
            \fi
            .\par
	\end{center}

    \vspace*{\fill}

    \noindent
    \hfill
    \begin{tabular}
        {>{\raggedleft\arraybackslash}p{.48\textwidth}
         >{\raggedleft\arraybackslash}p{.48\textwidth}}
        \@ifundefined{@advisorb}{%
            \@ifundefined{@coadvisora}{}{%
                \@advisora
            }%
        }{%
          \@advisora
        }%
        &
        \@ifundefined{@advisorb}{%
            \@ifundefined{@coadvisora}{%
                \@advisora
            }{%
                \@coadvisora
            }%
        }{%
                \@advisorb
        }%
        \\[40pt]

        \@ifundefined{@advisorb}{%
          \mbox{}%
        }{%
          \@ifundefined{@coadvisorb}{%
            \mbox{}%
          }{%
            \@coadvisora%
          }%
        }%
        &
        \@ifundefined{@coadvisorb}{%
          \@ifundefined{@advisorb}{%
            \mbox{}%
          }{%
            \@ifundefined{@coadvisora}{\mbox{}}{\@coadvisora}%
          }%
        }{%
          \@coadvisorb%
        }
        \\
    \end{tabular}

	\mbox{}
	\vfill
	\begin{flushright}
        \textbf {Prof. \@coordenador} \\
        \coordinatorname{} PPGCI/UFRGS\\
        \vskip 1.48cm
		\textbf{\MakeUppercase{\examinersname}}\\
        \vskip 1.05cm
}{%
	\end{flushright}
	\vfill
}
