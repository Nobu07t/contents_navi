# テーブル設計

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| birth_date         | date       | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |

### Association

* has_many :spots
* has_many :comments


## spotテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| genre_id           | integer    | null: false                   |
| title              | string     | null: false                   |
| catch_copy         | text       | null: false                   |
| postal_code        | string     |                               |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| addresses          | string     |                               |
| user               | references | null: false foreign_key: true |

### Association

* belongs_to :user
* has_many :comments

## commentsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| content            | text       | null: false                   |
| spot               | references | null: false foreign_key: true |
| user               | references | null: false foreign_key: true |

### Association

- belongs_to :spot
- belongs_to :user