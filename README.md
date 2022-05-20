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

# bundle exec rspec spec/models/item_spec.rb 
# @tweet.valid?
# @tweet.errors.full_messages
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




#################################################
都道府県データを作成
############################################################
class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '北海道' }, { id: 3, name: '青森県' },
    { id: 4, name: '岩手県' }, { id: 5, name: '宮城県' }, { id: 6, name: '秋田県' }, 
    { id: 7, name: '山形県' }, { id: 8, name: '福島県' }, { id: 9, name: '茨城県' },
    { id: 10, name: '栃木県' }, { id: 11, name: '群馬県' }, { id: 12, name: '埼玉県' },
    { id: 13, name: '千葉県' }, { id: 14, name: '東京都' }, { id: 15, name: '神奈川県' },
    { id: 16, name: '新潟県' }, { id: 17, name: '富山県' }, { id: 18, name: '石川県' },
    { id: 19, name: '福井県' }, { id: 20, name: '山梨県' }, { id: 21, name: '長野県' },
    { id: 22, name: '岐阜県' }, { id: 23, name: '静岡県' }, { id: 24, name: '愛知県' }, 
    { id: 25, name: '三重県' }, { id: 26, name: '滋賀県' }, { id: 27, name: '京都府' }, 
    { id: 28, name: '大阪府' }, { id: 29, name: '兵庫県' }, { id: 30, name: '奈良県' }, 
    { id: 31, name: '和歌山県' }, { id: 32, name: '鳥取県' }, { id: 33, name: '島根県' }, 
    { id: 34, name: '岡山県' }, { id: 35, name: '広島県' }, { id: 36, name: '山口県' }, 
    { id: 37, name: '徳島県' }, { id: 38, name: '香川県' }, { id: 39, name: '愛媛県' }, 
    { id: 40, name: '高知県' }, { id: 41, name: '福岡県' }, { id: 42, name: '佐賀県' }, 
    { id: 43, name: '長崎県' }, { id: 44, name: '熊本県' }, { id: 45, name: '大分県' }, 
    { id: 46, name: '宮崎県' }, { id: 47, name: '鹿児島県' }, { id: 48, name: '沖縄県' }
]
include ActiveHash::Associations
has_many :area
end