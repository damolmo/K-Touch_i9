#Set build cache to 50G
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
source ~/.bashrc
ccache -M 50G

#Clean and update device tree source
cd $BUILDI9/twrp/device/ktouch
rm -rf i9
cd ../../
git clone -b TWRP-11-SAR https://github.com/daviiid99/K-Touch_i9.git device/ktouch/i9

#Lunch command and build twrp
. build/envsetup.sh
lunch omni_i9-eng
mka recoveryimage

#Download and Flash TWRP 
#out/target/product/i9/recovery.img #Result build will be inside this folder
fastboot flash recovery out/target/product/i9/recovery.img
