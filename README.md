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
[![Image from Gyazo](https://i.gyazo.com/59ea5d4676b6a76042187ba434d2ada8.gif)](https://gyazo.com/59ea5d4676b6a76042187ba434d2ada8)
### `Statusを先生にすることでルーム作成ができるようになる`
### `ルームの作成を選択しルームを作成する。この時ユーザーをsiftもしくはcommandを押しながら選択することで複数人選択できる`
### `ルームの作成が完了したらルーム一覧から作成したルームを選択する`
### `type a messageにメッセージを入力し送信ボタンを押すことで非同期でメッセージを送信することができる`
### `画像は非同期で送れないため画像を選択し送信ボタンを押した後でリロードすることで写すことができる`
### `


[![Image from Gyazo](https://i.gyazo.com/da7ee707b4b71e507bd2044d46b594cb.gif)](https://gyazo.com/da7ee707b4b71e507bd2044d46b594cb)


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