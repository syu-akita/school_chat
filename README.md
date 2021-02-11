# :sunny: SchoolChat
### 先生と保護者のコミュニケーションツール

<img width="1440" alt="9a8b25abec2f3a8c34a0be82c02d15d2" src="https://user-images.githubusercontent.com/75475114/106707141-1a451680-6634-11eb-928e-ac738481279a.png">


# :sunny: 概要

### 子供から手紙をもらえずに困っている保護者の方
### 連絡網を回す先生たち

そのような学校であるあるの悩みを解消するためにこのアプリを作成いたしました。<br>
意見箱もあるので学校側にも気軽に意見を出すことができます。


# :cyclone: App URL
### **https://school-chat-0612.herokuapp.com/**


# :computer: 利用方法

### `ユーザー登録ページからから新規登録、ログイン`
### `トップページに遷移する`
[![Image from Gyazo](https://i.gyazo.com/6419a632eb4d75c9702f0515ca21472b.gif)](https://gyazo.com/6419a632eb4d75c9702f0515ca21472b)
--------------------------------------------------------------------------------------------------------------------------------------
[![Image from Gyazo](https://i.gyazo.com/59ea5d4676b6a76042187ba434d2ada8.gif)](https://gyazo.com/59ea5d4676b6a76042187ba434d2ada8)
--------------------------------------------------------------------------------------------------------------------------------------
### `Statusを先生にすることでルーム作成ができるようになる`
### `ルームの作成を選択しルームを作成する。この時ユーザーをsiftもしくはcommandを押しながら選択することで複数人選択できる`
[![Image from Gyazo](https://i.gyazo.com/68d87ddf514cd6d711aa541a75a172fd.gif)](https://gyazo.com/68d87ddf514cd6d711aa541a75a172fd)
--------------------------------------------------------------------------------------------------------------------------------------
### `ルームの作成が完了したらルーム一覧から作成したルームを選択する`
### `type a messageにメッセージを入力し送信ボタンを押すことで非同期でメッセージを送信することができる`
[![Image from Gyazo](https://i.gyazo.com/ae73246f62b80c30c1a9e88ac0d69d37.gif)](https://gyazo.com/ae73246f62b80c30c1a9e88ac0d69d37)
--------------------------------------------------------------------------------------------------------------------------------------
### `画像は非同期で送れないため画像を選択し送信ボタンを押した後でリロードすることで写すことができる`
[![Image from Gyazo](https://i.gyazo.com/16520f9d52c1a095ed6dc00581eb9691.gif)](https://gyazo.com/16520f9d52c1a095ed6dc00581eb9691)
--------------------------------------------------------------------------------------------------------------------------------------
### `目安箱ボタンを押すと目安箱投稿フォームに遷移する`
[![Image from Gyazo](https://i.gyazo.com/9d1266762aad61c742fdff370a4a7a50.gif)](https://gyazo.com/9d1266762aad61c742fdff370a4a7a50)
--------------------------------------------------------------------------------------------------------------------------------------
### `タイトルと本文を入れると送信完了フォームに遷移する`
[![Image from Gyazo](https://i.gyazo.com/1477bccf79941e5862c90effea7ad8d2.gif)](https://gyazo.com/1477bccf79941e5862c90effea7ad8d2)
--------------------------------------------------------------------------------------------------------------------------------------
### `目安箱の中身を押すと送られてきた意見の内容がみれる`
[![Image from Gyazo](https://i.gyazo.com/03e702c2ca5d4b154b5741ddef4d9d65.gif)](https://gyazo.com/03e702c2ca5d4b154b5741ddef4d9d65)
--------------------------------------------------------------------------------------------------------------------------------------
### `削除ボタンを押すと意見箱の中身を削除できる`
[![Image from Gyazo](https://i.gyazo.com/dd8067fb1d4c20d85c812e39e421026f.gif)](https://gyazo.com/dd8067fb1d4c20d85c812e39e421026f)
--------------------------------------------------------------------------------------------------------------------------------------
### `削除ボタンは先生じゃないと表示されない`
[![Image from Gyazo](https://i.gyazo.com/c6e689b4919bb0fee46f1a6289ab62a2.gif)](https://gyazo.com/c6e689b4919bb0fee46f1a6289ab62a2)
--------------------------------------------------------------------------------------------------------------------------------------


# データベース設計



## roomsテーブル

| Column      | Type              | Options                         |
| ----------- | ----------------- | ------------------------------- |
| name        | string            | null: false                     |

### Association
- has_many room_users
- has_many users, through: room_users
- has_many messages

## usersテーブル

| Column      | Type              | Options                         |
| ----------- | ----------------- | ------------------------------- |
| email       | string            | null: false                     |
| password    | string            | null: false                     |
| name        | string            | null: false                     |
| group_id    | integer           | null: false                     |
| status_id   | integer           | null: false                     |

### Association
- has_many room_users
- has_many rooms, through: room_users
- has_many messages

<!-- group_idおよびstatus_idはactive_hashにより導入 -->

## messagesテーブル

| Column      | Type              | Options                         |
| ----------- | ----------------- | ------------------------------- |
| text        | text              | null: false                     |
| user        | references        | foreign_key: true               |
| room        | references        | foreign_key: true               |

### Association
- belongs_to user
- belongs_to room

<!-- imageも追加するがactive_strageで実装する -->
## room_usersテーブル

| Column      | Type              | Options                         |
| ----------- | ----------------- | ------------------------------- |
| user        | references        | foreign_key: true               |
| room        | references        | foreign_key: true               |

### Association
- belongs_to user
- belongs_to room