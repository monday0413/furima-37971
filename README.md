# README

# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
|family_name          |string  | null: false |
|first_name           |string  | null: false |
|family_name_kana     |string  | null: false |
|first_name_kana      |string  | null: false |
|birth_year           |string  | null: false |
|birth_month          |string  | null: false |
|birth_day            |string  | null: false |
### Association

- has_many :items
- has_many :buy_records


## items テーブル

|      Column            | Type      | Options     |
| ---------------------- | --------- | -----------  |
| user                   | references| null: false, foreign_key: true |
|item_image              | string    | null: false |
|item_name               | string    | null: false |
|explanation(説明)        | text      | null: false |
|category                | string    | null: false |
|condition               | string    | null: false |
|send_charge（配送料の負担）| integer   | null: false |
|send_area(発送元地域)     | string    | null: false |
|Days_ship(発送までの日数)  |integer   | null: false |
|price                    |integer   | null: false |
### Association

- has_many :users
- belongs_to :buy 


______________________
## buy （購入記録情報） テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
|send     | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
### Association

- belongs_to :item
- has_many :users
- belongs_to :send_info

＿＿＿＿＿＿＿＿＿＿＿＿＿＿
## send(発送先情報) テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
|buy               | references | null: false, foreign_key: true |
| post_code        | integer    | null: false                    |
| prefecture(県)   | string      | null: false                    |
| city             | string      | null: false                    |
| address          | string      | null: false                    |
|building_name(建物)| string      | null: false                    |
|phone_number      |  integer    | null: false                     |

### Association

- belongs_to :buy
