#!/bin/bash

#check if an argument passed (filename)

LAB_NAME=$1
NAME=$2
if [ -z "$LAB_NAME" ]; then
    echo "No lab-name supplied"
    exit
fi

DIR_NAME="4_sem/laba_$LAB_NAME"
if [ -d "$DIR_NAME" ]; then
    echo "Directory $DIR_NAME is already exists"
    exit
fi

mkdir  -p $DIR_NAME

# cp laba_name/name.ipynb $DIR_NAME/$LAB_NAME.ipynb

cp -r laba_name/name_tex/ $DIR_NAME/tex/

mv $DIR_NAME/tex/name_tex.tex $DIR_NAME/tex/$LAB_NAME.tex

if [ -z "$2" ]; then
    echo "\title{\textbf{Лабораторная работа $LAB_NAME}}\\\\ [2pt]}
\date{\today}
\author{Татаурова Юлия Романовна}

\begin{document}
\maketitle
\input{$LAB_NAME.tex}
\end{document}" >> $DIR_NAME/tex/main.tex
else
     echo "\title{\textbf{Лабораторная работа $LAB_NAME}\\\\ [2pt]{$NAME}}
\date{\today}
\author{Татаурова Юлия Романовна}

\begin{document}
\maketitle
\input{$LAB_NAME.tex}
\end{document}" >> $DIR_NAME/tex/main.tex

fi

echo done! $1 is made!
