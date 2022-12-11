# config-tftp-server

ネットワーク機器等のファームウェアアップデートに利用するTFTPサーバをDockerコンテナとして簡単に構築するために作成したコンフィグです。

`./tftp_dir` にTFTPでやりとりするファイル等を格納します。

## 動かし方

- 環境
  - ホストOS: Ubuntu20.04
  - シェル（ `$ echo $SHELL` ）: `/bin/bash`
  - `$ docker -v`: `Docker version 20.10.12`
  - `$ docker-compose -v`: `docker-compose version 1.25.0`

```
$ git clone https://github.com/yu1k/config-tftp-server.git config-tftp-server && cd $_
$ chmod 777 ./tftp_dir && docker-compose up -d --build
```

GitHub からgit cloneしてconfig-tftp-serverディレクトリに移動します。

TFTPでやりとりするファイルを置く `./tftp_dir` に 777 の権限をつけて TFTPサーバ コンテナを起動させます。

docker-composeのportsでホスト側のポート 69/udp とコンテナ内のポート 69/udp をフォワーディングしてあるので、ホストにTFTPサーバを立てた構成と同じ利用方法でTFTPサーバを利用できます。

## 各種コマンド

```
$ docker-compose restart [container_name]
指定したコンテナを再起動する

$ docker-compose stop [container_name]
指定したコンテナを停止する

$ docker-compose down --rmi local
起動したコンテナを停止し、コンテナ、ネットワーク、ボリューム、イメージ等の関連するリソースを削除する
```
