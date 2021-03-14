#Set build cache to 50G
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
source ~/.bashrc
ccache -M 50G

#Lunch command and build twrp
cd twrp
. build/envsetup.sh
lunch omni_i9-eng
mka recoveryimage

#Download and Flash TWRP 
#out/target/product/i9/recovery.img #Result build will be inside this folder
fastboot flash recovery out/target/product/i9/recovery.img
