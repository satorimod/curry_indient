# アプリ名
<h1 id="logo"><link href="https://fonts.googleapis.com/css?family=Cherry+Swash:700" rel="stylesheet" class="title">Curry Indient</a></h1>

# 概要
幅広いインドカレーの文化を共有しやすくするためのグルメレビューアプリです。</ br> タイトルのIndientというのは造語で、Incident(事変)とIndiaを合わせて作った言葉です。


# テーブル設計

## userテーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |
| date_of_birth      | date   | null: false               |
| nickname           | string | null: false               |

### Association
- has_many :gourmets
- has_many :comments

## gourmetsテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| genre_id | integer    | null: false                    |
| area_id  | integer    | null: false                    |
| feature  | text       | null: false                    |
| content  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| gourmet | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :gourmet
