# README
## usersテーブル

| Column   | Type         | Options     | 
| -------- | ------       | ----------- | 
| name     | string       | null: false | 
| email    | unique: true | null: false | 
| password | string       | null: false | 
| birthday | string       | null: false | 

### Association

- has_many :items
- has_many :purchases
- has_one :address


## itemsテーブル

| Column                | Type   | Options     | 
| ------------          | ------ | ----------- | 
| name                  | string | null: false | 
| price                 | string | null: false | 
| category              | string | null: false | 
| status                | string | null: false | 
| delivery_fee          | string | null: false | 
| place                 | string | null: false | 
| delivery_date         | string | null: false | 

### Association

- belongs_to :user
- has_one :purchase


## addressesテーブル

| Column       | Type   | Options     | 
| ------------ | ------ | ----------- | 
| postal_code  | string | null: false | 
| state        | string | null: false | 
| city         | string | null: false | 
| address_line | string | null: false | 
| phone_number | string | null: false | 

### Association

- belongs_to :user
- belongs_to :purchase


## purchaseテーブル

| Column        | Type   | Options     | 
| ------------- | ------ | ----------- | 
| item_name     | string | null: false | 
| user_name     | string | null: false | 
| purchase_date | string | null: false | 

### Association

- belongs_to :item
- belongs_to :user
- has_many :addresses

