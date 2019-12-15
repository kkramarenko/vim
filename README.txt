Quick-start:

1. Install Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

2. Install Plugins
  vim
  :PluginInstall

3. Install fonts
  pip install --user git+git://github.com/powerline/powerline
  wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
  wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
  mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
  fc-cache -vf (current directory with fonts)  
