# README
## usersテーブル

| Column               | Type         | Options     | 
| -------------------- | ------------ | ----------- |
| nickname             | string       | null: false | 
| first_name           | string       | null: false | 
| last_name            | string       | null: false |
| first_reading        | string       | null: false |
| last_reading         | string       | null: false |
| email                | string       | null: false | 
| encrypted_password   | string       | null: false | 
| birthday             | date         | null: false | 

### Association

- has_many :items
- has_many :purchases



## itemsテーブル

| Column                   | Type    | Options     | 
| ------------------------ | ------- | ----------- | 
| name                     | string  | null: false | 
| price                    | integer | null: false |
| explain_item             | string  | null: false |
| seller_name              | string  | null: false | 
| category_id              | integer | null: false | 
| status_id                | integer | null: false | 
| delivery_fee_id          | integer | null: false | 
| place_id                 | integer | null: false | 
| delivery_date_id         | integer | null: false | 

### Association

- belongs_to :user
- has_one :purchase


## addressesテーブル

| Column         | Type     | Options     | 
| -------------- | -------- | ----------- | 
| postal_code    | string   | null: false | 
| prefecture_id  | integer  | null: false | 
| city           | string   | null: false |
| house_number   | string   | null: false |
| building_name  | string   | null: false | 
| phone_number   | integer  | null: false | 

### Association

- belongs_to :purchase


## purchasesテーブル

| Column        | Type      | Options     | 
| ------------- | --------- | ----------- | 
| item_id       | reference | null: false | 
| user_id       | reference | null: false | 

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

