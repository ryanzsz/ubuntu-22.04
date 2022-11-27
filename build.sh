# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/NusantaraProject-ROM/android_manifest -b 10 -g default,-mips,-darwin,-notdefault
git clone https://github.com/ryanzsz/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch nad_ginkgo-userdebug
export TZ=Asia/Jakarta
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=android-build
export ALLOW_MISSING_DEPENDENCIES=true
# export SELINUX_IGNORE_NEVERALLOWS=true
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
mka nad -j8
# build 
