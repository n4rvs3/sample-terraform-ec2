# Terraform を用いて macOS 上から ec2 に環境を構築するサンプル

## 実行環境

- MacBook Air 2019
- macOS Big Sur 11.6.2

## terraform-cli のインストール

1. `brew install tfenv`
2. `tfenv list-remote` 今回は`1.2.2`を利用
3. `tfenv install 1.2.2`
4. `tfenv use 1.2.2`

## aws-cli のインストール

今回は`sudo`へのアクセス権限が存在するユーザー前提の話

くわしくは[AWS 公式の Doc](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)を読む

作業前に事前に ec2 へアクセス可能な IAM ロールを作成・キーを控えておく。

1. 適当なディレクトリで `curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"`
2. `sudo installer -pkg AWSCLIV2.pkg -target /`
3. `which aws` -> `/usr/local/bin/aws` なら成功
4. `aws --version` -> `aws-cli/2.7.12 Python/3.9.11 Darwin/20.6.0 exe/x86_64 prompt/off` command not found となる場合はパスを自身で通す
5. `aws configure --profile {iamのプロファイル名}`
6. IAM のアクセスキーを入力
7. IAM のシークレットアクセスキーを入力
8. `ap-northeast-1`
9. `json`

## Terraform のファイルを作っていく

1. 適当なディレクトリを作成、移動
2. `touch main.tf`
3. `code .` -> vscode にてファイルを編集する
4. ファイル内容は[こちら](./terraform/main.tf)

## Terraform の初期化、実行

1. `terraform init`
2. `terraform plan`
3. 上記コマンドにてプロファイル名を聞かれるので先ほど aws-cli にて設定したプロファイル名を入力
4. `terraform apply`
5. 同じプロファイルを入力
6. 確認が入るので`yes`
7. EC2 コンソールにて立ち上がっているのを確認

## Terraform で削除

1. 該当ディレクトリにて `terraform destroy`
2. 確認が入るので`yes`
3. 終了済みになっていることを確認
