# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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