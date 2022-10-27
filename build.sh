#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android.git -b 13.0 -g default,-mips,-darwin,-notdefault
git clone https://github.com/ryanzsz/local_manifest --depth 1 -b CR-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch lineage_whyred-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=ryanzsz
export KBUILD_BUILD_HOST=jenkins
export BUILD_USERNAME=ryanzsz
export BUILD_HOSTNAME=jenkins
export ALLOW_MISSING_DEPENDENCIES=true
# export SELINUX_IGNORE_NEVERALLOWS=true
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
mka bacon -j8
# build 2
