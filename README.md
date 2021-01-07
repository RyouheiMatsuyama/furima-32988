# README

## users テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nick_name             | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birth_date            | date   | null: false |

### Association
-has_many :listings
-has_one  :purchase

## listings テーブル
| Column                  | Type      | Options           |
| ----------------------- | --------- | ----------------- |
| items_name              | text      | null: false       |
| items_explanation       | text      | null: false       |
| items_details_categoly  | string    | null: false       |
| items_details_state_id  | integer   | null: false       |
| shipping_fee_burden_id  | integer   | null: false       |
| prefecture_id           | integer   | null: false       |
| days_to_ship_id         | integer   | null: false       |
| selling_price           | string    | null: false       |
| user                    | reference | foreign_key: true |

### Association
-belongs_to :user
-has_one  :purchase

## prefecturesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |

### Association
-has_one :user
-has_one :listing
-has_one :purchase

## purchases テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| listings      | reference  | foreign_key: true |
| user          | reference  | foreign_key: true |

### Association
-has_one  :prefecture