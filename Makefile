all:
	if [ ! -e ~/.vim ]    || [ -h ~/.vim ];    then ln -fs $(PWD) ~/.vim; fi
	if [ ! -e ~/.vimrc ]  || [ -h ~/.vimrc ];  then ln -fs $(PWD)/vimrc ~/.vimrc;   else echo "~/.vimrc exists, I can't overwrite it"; fi
	if [ ! -e ~/.gvimrc ] || [ -h ~/.gvimrc ]; then ln -fs $(PWD)/gvimrc ~/.gvimrc; else echo "~/.gvimrc exists, I can't overwrite it"; fi
