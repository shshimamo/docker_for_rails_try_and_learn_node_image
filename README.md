# docker_for_rails_try_and_learn_node_image
Get node.js and yarn from image

(インストールパスの確認)

node公式イメージからコンテナを起動し
```
% docker run -it node:10.15.3-stretch bash
```

nodeとyarnのインストールされている場所を確認する
```
root@1aae2d549b5c:/# which node yarn
/usr/local/bin/node
/usr/local/bin/yarn

root@1aae2d549b5c:/# ls -l /usr/local/bin/node
-rwxrwxr-x 1 root staff 39224256 Mar  5  2019 /usr/local/bin/node

root@1aae2d549b5c:/# ls -l /usr/local/bin/yarn
lrwxrwxrwx 1 root root 26 May  8  2019 /usr/local/bin/yarn -> /opt/yarn-v1.13.0/bin/yarn
```
