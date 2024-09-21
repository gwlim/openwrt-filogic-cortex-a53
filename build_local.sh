#! /bin/bash

git clone --depth=1 https://github.com/openwrt/openwrt.git

sed -i 's/git.openwrt.org\/feed/github.com\/openwrt/g' ./openwrt/feeds.conf.default
sed -i 's/git.openwrt.org\/project/github.com\/openwrt/g' ./openwrt/feeds.conf.default

./build_mtk_openwrt.sh
