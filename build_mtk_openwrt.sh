#! /bin/bash

git clone --depth=1 https://github.com/openwrt/openwrt.git

sed -i 's/git.openwrt.org\/feed/github.com\/openwrt/g' ./feeds.conf.default
sed -i 's/git.openwrt.org\/project/github.com\/openwrt/g' ./feeds.conf.default

sed -i 's/wpad-basic-mbedtls/wpad-basic-openssl/g' ./target/linux/mediatek/filogic/target.mk
sed -i 's/# CONFIG_CRYPTO_DEV_SAFEXCEL is not set/CONFIG_CRYPTO_DEV_SAFEXCEL=y/' ./target/linux/generic/config-6.6
sed -i 's/CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y/# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_SHA1_ARM64_CE is not set/CONFIG_CRYPTO_SHA1_ARM64_CE=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_SHA512_ARM64_CE is not set/CONFIG_CRYPTO_SHA512_ARM64_CE=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_SM3_GENERIC is not set/CONFIG_CRYPTO_SM3_GENERIC=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_SM3_NEON is not set/CONFIG_CRYPTO_SM3_NEON=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_STREEBOG is not set/CONFIG_CRYPTO_STREEBOG=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_CHACHA20_NEON is not set/CONFIG_CRYPTO_CHACHA20_NEON=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CRYPTO_POLY1305_NEON is not set/CONFIG_CRYPTO_POLY1305_NEON=y/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y/# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/CONFIG_CPU_FREQ_GOV_POWERSAVE=y/# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/CONFIG_CPU_FREQ_GOV_USERSPACE=y/# CONFIG_CPU_FREQ_GOV_USERSPACE is not set/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/CONFIG_CPU_FREQ_GOV_ONDEMAND=y/# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/CONFIG_FRAME_POINTER=y/# CONFIG_FRAME_POINTER=y is not set/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y/# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set/' ./target/linux/mediatek/filogic/config-6.6
sed -i 's/# CONFIG_HZ_250 is not set/CONFIG_HZ_250=y/' ./target/linux/generic/config-6.6
sed -i 's/CONFIG_HZ_100=y/# CONFIG_HZ_100 is not set/' ./target/linux/generic/config-6.6
sed -i 's/CONFIG_HZ=100/CONFIG_HZ=250/' ./target/linux/generic/config-6.6
sed -i 's/# CONFIG_DEBUG_INFO_REDUCED is not set/CONFIG_DEBUG_INFO_REDUCED=y/' ./target/linux/generic/config-6.6

for i in $(ls mtk_patch)
do
    git apply mtk_patch/$i
done

./scripts/feeds update -a

./scripts/feeds install -a

make defconfig

sed -i 's/# CONFIG_LUCI_SRCDIET is not set/CONFIG_LUCI_SRCDIET=y/' .config
sed -i 's/CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_mediatek_mt7988a-rfb=y/# CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_mediatek_mt7988a-rfb is not set/' .config
sed -i 's/CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_bananapi_bpi-r4=y/# CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_bananapi_bpi-r4 is not set/' .config
sed -i 's/CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_bananapi_bpi-r4-poe=y/# CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_bananapi_bpi-r4-poe is not set/' .config
