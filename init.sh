set -e

sudo -v

type git > /dev/null 2>&1 || sudo pacman -S git --needed

mkdir -p $HOME/repos $HOME/prefix/bin $HOME/build

cd $HOME/repos

if [ ! -d scripts ]; then
  git clone https://github.com/lennart96/scripts
fi

cd scripts

source shrc

if bin_exists pacman ; then
    sudo pacman -S $(cat packages) --needed
fi

ln -s $HOME/repos/scripts/shrc $HOME/.bashrc
ln -s $HOME/repos/scripts/shrc $HOME/.zshrc

make -C cross TARGET=x86_64-elf
make -C cross TARGET=i586-elf

alert done -t 200000
