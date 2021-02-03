# SchoolChat
### 先生と保護者のコミュニケーションツール

![toppage](https://gyazo.com/9a8b25abec2f3a8c34a0be82c02d15d2)



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