# 某web会議予約システムのユーザー選択まわりのモック

## About

西川さん向け

Ruby(3.1.1推奨)とdocker-composeが動く環境で

dipをインストール
```
gem install dip
```
して、
```
dip compose build
dip bundle install
dip yarn install --check-files
dip provision
dip rails db:seed
dip rails s
```
ぐらいで動くんじゃないかな。
動くといいな。

http://localhost:3000
で動作確認

「参加者リストを編集」の先は未実装
