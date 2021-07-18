# K-TOUCH i9 | TWRP

<img src="https://github.com/daviiid99/K-Touch_i9/blob/main/Screenshot_2010-01-28-09-54-07.png">

Device tree para TeamWin Recovery Project en K-Touch i9, compatible con Android 11 y system_as_root

# Build instructions

```
#Install dependencies
sudo apt update&&sudo apt install git-core gnupg flex bison gperf zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip default-jdk build-essential git fastboot adb python python3 rsync git aria2

#Install latest repo
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

#Install Android SDK Platform Tools
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
cat >> ~/.profile<< EOF
if [ -d "\$HOME/platform-tools" ] ; then
    PATH="\$HOME/platform-tools:\$PATH"
fi
EOF

#Set build cache to 50G
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
source ~/.bashrc
ccache -M 50G

#Git config
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# Ofox Build environment
git clone https://gitlab.com/OrangeFox/misc/scripts
cd scripts
sudo bash setup/android_build_env.sh
sudo bash setup/install_android_sdk.sh

#Create Ofox root folder
mkdir ~/OrangeFox_10&&cd ~/OrangeFox_10

#Download and sync Ofox manifest
rsync rsync://sources.orangefox.download/sources/fox_10.0 . --progress -a

#Clone K-Touch i9 device tree and create device folder
git clone -b TWRP-11-SAR https://github.com/daviiid99/K-Touch_i9.git device/ktouch/i9

#Lunch command and build ofox
source build/envsetup.sh && export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1 && export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1 && export FOX_USE_NANO_EDITOR=1 && export LC_ALL="C"
lunch omni_i9-eng
mka recoveryimage

#Download and Flash Ofox
#out/target/product/i9/recovery.img #Result build will be inside this folder
fastboot flash recovery out/target/product/i9/recovery.img
```
