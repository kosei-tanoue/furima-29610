# README
## usersテーブル

| Column               | Type         | Options     | 
| -------------------- | ------------ | ----------- | 
| first_name           | string       | null: false | 
| last_name            | string       | null: false |
| first_name(furigana) | string       | null: false |
| last_name(furigana)  | string       | null: false |
| email                | unique: true | null: false | 
| encrypted_password   | string       | null: false | 
| birthday             | string       | null: false | 

### Association

- has_many :items
- has_many :purchases
- has_one :address


## itemsテーブル

| Column                   | Type    | Options     | 
| ------------------------ | ------- | ----------- | 
| name                     | string  | null: false | 
| price                    | integer | null: false | 
| category_id              | integer | null: false | 
| status_id                | integer | null: false | 
| delivery_fee_id          | integer | null: false | 
| place_id                 | integer | null: false | 
| delivery_date_id         | integer | null: false | 

### Association

- belongs_to :user
- has_one :purchase


## addressesテーブル

| Column       | Type   | Options     | 
| ------------ | ------ | ----------- | 
| postal_code  | string | null: false | 
| state        | string | null: false | 
| city         | string | null: false |
| town         | string | null: false |
| address_line | string | null: false | 
| phone_number | string | null: false | 

### Association

- belongs_to :user
- belongs_to :purchase


## purchaseテーブル

| Column        | Type      | Options     | 
| ------------- | --------- | ----------- | 
| item_id       | reference | null: false | 
| user_id       | reference | null: false | 
| purchase_date | string    | null: false | 

### Association

- belongs_to :item
- belongs_to :user
- has_many :addresses

