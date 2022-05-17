# README

# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false unique: true|
| encrypted_password  | string | null: false |
|family_name          |string  | null: false |
|first_name           |string  | null: false |
|family_name_kana     |string  | null: false |
|first_name_kana      |string  | null: false |
|birth_day            |date	  | null: false |
### Association

- has_many :items
- has_many :buys


## items テーブル

|      Column               | Type      | Options     |
| ------------------------- | --------- | -----------  |
| user                      | references| null: false, foreign_key: true |
|item_name                  | string    | null: false |
|explanation(説明)           | text      | null: false |
|category_id                |  integer  | null: false |
|condition_id               |  integer  | null: false |
|send_charge_id（配送料の負担）| integer   | null: false |
|prefecture_id(発送元地域)    | integer   | null: false |
|days_ship_id(発送までの日数)  | integer  | null: false |
|price                       | integer  | null: false |
### Association

- belongs_to :user
- has_one :buy
<!-- - belongs_to :buy  -->

______________________
## buys （購入記録情報） テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user
- has_one :address

＿＿＿＿＿＿＿＿＿＿＿＿＿＿
## addresses（発送先情報) テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
|buy               | references | null: false, foreign_key: true |
| post_code        | string    | null: false                    |
| prefecture_id(県) | integer      | null: false                    |
| city             | string      | null: false                    |
| address          | string      | null: false                    |
|building_name(建物)| string      |                                 |
|phone_number      |  string    | null: false                     |

### Association

- belongs_to :buy
