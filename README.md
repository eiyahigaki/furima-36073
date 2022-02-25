# テーブル設計

## usersテーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|en_family         |string|null: false              |
|en_first          |string|null: false              |
|kana_family       |string|null: false              |
|kana_first        |string|null: false              |
|birth             |date  |null: false              |

### Association

- has_many :items
- has_many :histories

## itemsテーブル

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|title      |string    |null: false                   |
|detail     |text      |null: false                   |
|category_id|integer   |null: false                   |
|state_id   |integer   |null: false                   |
|charge_id  |integer   |null: false                   |
|area_id    |integer   |null: false                   |
|term_id    |integer   |null: false                   |
|price      |integer   |null: false                   |
|user       |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :history

## historiesテーブル

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|postal_code|string    |null: false                   |
|area_id    |integer   |null: false                   |
|city       |string    |null: false                   |
|address    |string    |null: false                   |
|building   |string    |                              |
|tel        |string    |null: false                   |
|history    |references|null: false, foreign_key: true|

### Association

- belongs_to :history
