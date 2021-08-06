# K-TOUCH i9 | TWRP (NO LONGER SUPPORTED)

<img src="https://github.com/daviiid99/K-Touch_i9/blob/main/Screenshot_2010-01-28-09-54-07.png">

Device tree para TeamWin Recovery Project en K-Touch i9, compatible con Android 11 y system_as_root

# Build instructions

```
#Install dependencies
sudo apt update&&sudo apt install git-core gnupg flex bison gperf zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip default-jdk build-essential git fastboot adb python python3 rsync

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

#Create twrp root folder
mkdir -p twrp&&cd twrp

#Download and sync TWRP manifest
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
repo sync -j$(nproc --all)

#Clone K-Touch i9 device tree and create device folder
git clone -b TWRP-11-SAR https://github.com/daviiid99/K-Touch_i9.git device/ktouch/i9

#Lunch command and build twrp
. build/envsetup.sh
lunch omni_i9-eng
mka recoveryimage

#Download and Flash TWRP 
#out/target/product/i9/recovery.img #Result build will be inside this folder
fastboot flash recovery out/target/product/i9/recovery.img
```
# Custom Theme for K-TOUCH i9
You can build an image with a TWRP custom theme, but keep in mind that this theme is deprecated in TWRP 3.5 or higher, you can mount the result recovery.img and replace the twres inside with <a href="https://github.com/daviiid99/K-Touch_i9/tree/twres">this theme</a>
