########
## Installing wine 
## source: https://wiki.winehq.org/Ubuntu
######
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

## for 21.04 check the source for different versions
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'

sudo apt update
sudo apt install --install-recommends winehq-staging

########
## download the last launcher (Windows)
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
####
mv EveLauncher-2023444.exe EveLauncher-2023444.exe
WINEPREFIX=$HOME/wineprefixes/eve/ wine $HOME/.cache/eve/EveLauncher-2023444.exe

######
## Run Launcher
####
WINEDEBUG=-all WINEPREFIX=$HOME/wineprefixes/eve/ wine C:\\\\Eve\\eve.exe
