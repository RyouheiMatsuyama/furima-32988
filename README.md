# README

## users テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nick_name             | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birth_date            | date   | null: false |

### Association
-has_many :listings
-has_one  :purchase

## listings テーブル
| Column                 | Type      | Options           |
| ---------------------- | --------- | ----------------- |
| items_name             | text      | null: false       |
| items_explanation      | text      | null: false       |
| items_details_categoly | string    | null: false       |
| items_details_state    | string    | null: false       |
| shipping_fee_burden    | string    | null: false       |
| shipment_source_area   | string    | null: false       |
| days_to_ship           | string    | null: false       |
| selling_price          | string    | null: false       |
| image                  |           |                   |
| user                   | reference | foreign_key: true |

### Association
-belongs_to :user
-has_one  :purchase


## purchases テーブル
| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | string     | null: false       |
| address      | string     | null: false       |
| building     | string     | null: false       |
| phone_number | string     | null: false       |
| prefectures  | reference  | foreign_key: true |
| user         | reference  | foreign_key: true |

### Association

-has_one  :user
-has_one  :listing