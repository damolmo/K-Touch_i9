# K-TOUCH i9 | TWRP

<img src="https://github.com/daviiid99/K-Touch_i9/blob/main/PXL_20210309_010217459.jpg">

Device tree para TeamWin Recovery Project en K-Touch i9, compatible con Android 10 y las últimas fuentes.


# Build instructions

```
#Install dependencies
sudo apt update && sudo apt install git-core gnupg flex bison gperf zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip openjdk-8-jdk build-essential git fastboot adb

#Install latest repo
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

#Set build cache to 50G
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
source ~/.bashrc
ccache -M 50G

#Create twrp root folder
mkdir -p twrp&&cd twrp

#Download and sync TWRP manifest
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
repo sync -j$(nproc --all)

#Clone K-Touch i9 device tree and create device folder
git clone -b TWRP-10-SAR https://github.com/daviiid99/K-Touch_i9.git device/ktouch/i9

#Lunch command and build twrp
. build/envsetup.sh
lunch omni_i9-eng
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true 

#Download TWRP 
out/target/product/i9/recovery.img #Result build will be inside this folder
```
<br/>

<b>NOTA:</b>
Es posible que la compilación falle con el siguiente error:
```
cannot delete non-empty directory: root/vendor
could not make way for new symlink: root/vendor
```
Cambia a la ruta de conflicto y borra esa ruta:
```
cd out/target/product/i9/recovery/root
rm -rf vendor
cd ../../../../../../
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true
```

Si todo sale bien, deberías ver un log cómo el siguiente:
```
[100% 8416/8416] ----- Making recovery image ------

#### build completed successfully (01:00 (mm:ss)) ####
```
<br/>

<b>NOTA:</b>
Es posible que la compilación falle con el siguiente error:
```
cannot delete non-empty directory: root/etc
could not make way for new symlink: root/etc
```
Cambia a la ruta de conflicto y borra esa ruta:
```
cd out/target/product/i9/recovery/root
rm -rf etc
cd ../../../../../../
mka recoveryimage ALLOW_MISSING_DEPENDENCIES=true
```

Si todo sale bien, deberías ver un log cómo el siguiente:
```
[100% 8416/8416] ----- Making recovery image ------

#### build completed successfully (01:00 (mm:ss)) ####
```
