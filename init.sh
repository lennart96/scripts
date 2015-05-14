set -e

sudo -v

type git > /dev/null 2>&1 || sudo pacman -S git --needed

mkdir -p $HOME/repos $HOME/prefix/bin $HOME/build

cd $HOME/repos

if [ ! -d scripts ]; then
  git clone https://github.com/lennart96/scripts
fi

cd scripts

source $(pwd)/shrc

sudo pacman -Syu
sudo pacman -S --needed $(cat packages)

ln -s $HOME/repos/scripts/.ycm_extra_conf.py $HOME/.ycm_extra_conf.py
ln -s $HOME/repos/scripts/.zshrc $HOME/.zshrc
ln -s $HOME/repos/scripts/shrc $HOME/.bashrc
ln -s $HOME/repos/scripts/shrc $HOME/.zshrc

mkdir -p $HOME/.vim/tmp
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

(cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer --omnisharp-completer --gocode-completer)

cd .vim/bundle/YouCompleteMe
ls

pip install Theano
pip2 install Theano

npm install -g LiveScript bower

make -C cross TARGET=x86_64-elf
make -C cross TARGET=i586-elf

alert 'done!' -t 200000
