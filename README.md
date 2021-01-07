# README

## users テーブル
| Column                | Type   | Options      |
| --------------------- | ------ | ------------ |
| nick_name             | string | null: false  |
| email                 | string | unique: true |
| encrypted_password    | string | null: false  |
| last_name             | string | null: false  |
| first_name            | string | null: false  |
| first_name_kana       | string | null: false  |
| last_name_kana        | string | null: false  |
| birth_date            | date   | null: false  |

### Association
-has_many :listings
-has_one  :purchase

## listings テーブル
| Column                  | Type      | Options           |
| ----------------------- | --------- | ----------------- |
| name                    | text      | null: false       |
| explanation             | text      | null: false       |
| details_category_id     | integer   | null: false       |
| details_state_id        | integer   | null: false       |
| shipping_fee_burden_id  | integer   | null: false       |
| prefecture_id           | integer   | null: false       |
| days_to_ship_id         | integer   | null: false       |
| selling_price_id        | integer   | null: false       |
| user                    | reference | foreign_key: true |

### Association
-belongs_to :user
-has_one  :purchase

## prefecturesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| Municipality  | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | reference  | foreign_key: true |

### Association
-belongs_to :purchase

## purchases テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| listing       | reference  | foreign_key: true |
| user          | reference  | foreign_key: true |

### Association
-belongs_to :user
-belongs_to :listing
-has_one    :prefecture