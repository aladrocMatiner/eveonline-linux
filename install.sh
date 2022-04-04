########
## Installing wine 
## source: https://wiki.winehq.org/Ubuntu
######
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

## enabled for 21.04 check the winehq source for different versions
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'

#Ubuntu 21.10	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'
#Ubuntu 21.04	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
#Ubuntu 20.10	sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main'
#Ubuntu 20.04  sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
#Ubuntu 18.04  sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'


sudo apt update
sudo apt install --install-recommends winehq-staging

########
## download the last launcher (Windows)
## The one here is the latest as in today, grab a new one from: https://www.eveonline.com/download
####
wget https://www.eveonline.com/EveLauncher-2023444.exe

########
## WinePrefix
####
mkdir -p $HOME/wineprefixes/eve

########
## Symlink
####
mkdir -p $HOME/.cache/eve/EVESharedCache
mkdir -p $HOME/wineprefixes/eve/drive_c/EVE/
ln -s $HOME/.cache/eve/EVESharedCache $HOME/wineprefixes/eve/drive_c/EVE/EVESharedCache
mkdir -p $HOME/.config/ccp
mkdir -p $HOME/wineprefixes/eve/drive_c/users/$USER/AppData/Local/
ln -s $HOME/.config/ccp $HOME/wineprefixes/eve/drive_c/users/$USER/AppData/Local/CCP

########
## dxvk
####
mkdir $HOME/.cache/dxvk
wget https://github.com/doitsujin/dxvk/releases/download/v1.10.1/dxvk-1.10.1.tar.gz -O $HOME/.cache/dxvk/dxvk.tar.gz
tar -xvf $HOME/.cache/dxvk/dxvk.tar.gz -C $HOME/.cache/dxvk/
WINEPREFIX=$HOME/wineprefixes/eve/ $HOME/.cache/dxvk/dxvk-1.10.1/setup_dxvk.sh install

########
## (Optional) Other personal setting (only for me)
####
export LD_PRELOAD=""

######
## install the game
## Remeber to update the filename of the launcher you downloaded
####
mv EveLauncher-2023444.exe $HOME/.cache/eve/
WINEPREFIX=$HOME/wineprefixes/eve/ wine $HOME/.cache/eve/EveLauncher-2023444.exe

######
## Run Launcher
####
WINEDEBUG=-all WINEPREFIX=$HOME/wineprefixes/eve/ wine C:\\\\Eve\\eve.exe
