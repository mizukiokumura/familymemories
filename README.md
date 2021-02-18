# テーブル設計

## usersテーブル

| Column               | Type    | Options       |
| -------------------- | ------- | ------------- |
| nickname             | string  | null: false   |
| email                | string  | null: false   |
| password             | string  | null: false   |
| jp_last_name         | string  | null: false   |
| jp_first_name        | string  | null: false   |
| jp_kana_last_name    | string  | null: false   |
| jp_kana_first_name   | string  | null: false   |
| birthday             | string  | null: false   |
| profile              | text    |               |

### Association

- has_many :memories
- has_many :comments

## memories テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| title       | string     | null: false                     |
| memories    | date       | null: false                     |
| diary       | text       | null: false                     |
| user        | references | null: false,  foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| comment   | string      |                                |
| user      | references  | null: false, foreign_key: true |
| memory    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memory