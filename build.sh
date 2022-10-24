#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/BootleggersROM/manifest.git -b queso -g default,-mips,-darwin,-notdefault
git clone https://github.com/maung-bodaz/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch bootleg_whyred-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=maung-bodaz
export KBUILD_BUILD_HOST=jenkins
export BUILD_USERNAME=maung-bodaz
export BUILD_HOSTNAME=jenkins
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
mka bacon -j8
# build bootleggers
