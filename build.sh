#!/bin/bash
goreleaser --snapshot --skip-publish --rm-dist

#sshpass -p "b5e9vuf7x1m" scp ./dist/go-admin_linux_amd64/go-admin root@143.92.59.7:/www/wwwroot/xita6699.chia999.vip/admin/go-admin
#sshpass -p "Yuanshi20188" scp ./dist/go-admin_linux_amd64/go-admin root@129.226.177.221:/www/wwwroot/nft.star-fans.cn/admin/go-admin
sshpass -p "Yuanshi20188" ssh root@81.68.68.232 "/www/server/panel/pyenv/bin/supervisorctl stop 铸币系统:铸币系统_00"
sshpass -p "Yuanshi20188" ssh root@81.68.68.232 "rm -rf /www/wwwroot/nft.star-fans.cn/admin/go-admin"
sshpass -p "Yuanshi20188" scp ./dist/go-admin_linux_amd64/go-admin root@81.68.68.232:/www/wwwroot/nft.star-fans.cn/admin/go-admin
sshpass -p "Yuanshi20188" ssh root@81.68.68.232 "/www/server/panel/pyenv/bin/supervisorctl start 铸币系统:铸币系统_00"
echo "已上传至服务器"