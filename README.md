# README

## users テーブル
| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| email                 | string | unique: true null: false |
| encrypted_password    | string | null: false              |
| nick_name             | string | null: false              |
| last_name             | string | null: false              |
| first_name            | string | null: false              |
| first_name_kana       | string | null: false              |
| last_name_kana        | string | null: false              |
| birth_date            | date   | null: false              |


### Association
-has_many :items
-has_many :purchases

## items テーブル
| Column                  | Type      | Options           |
| ----------------------- | --------- | ----------------- |
| name                    | string    | null: false       |
| explanation             | text      | null: false       |
| details_category_id     | integer   | null: false       |
| details_state_id        | integer   | null: false       |
| shipping_fee_burden_id  | integer   | null: false       |
| prefecture_id           | integer   | null: false       |
| days_to_ship_id         | integer   | null: false       |
| selling_price           | integer   | null: false       |
| user                    | reference | foreign_key: true |

### Association
-belongs_to :user
-has_one  :purchase

## ordersテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | reference  | foreign_key: true |

### Association
-belongs_to :purchase

## purchases テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| item          | reference  | foreign_key: true |
| user          | reference  | foreign_key: true |

### Association
-belongs_to :user
-belongs_to :item
-has_one    :order