# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
|birth_date        | integer | null: false |

### Association

- has_many : buys
- has_many : items


## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| item_info       | text       | null: false |
| category        | string     | null: false |
| sales_status    | string     | null: false |
| shipping_fee    | string     | null: false |
| item_prefecture | string     | null: false |
| schedule        | string     | null: false |
| price           | integer    | null: false |
| user            | references | null: false |


### Association

- belongs_to : user
- belong_to  : item


## buys テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| card_num    | string     | null: false |
| exp_month   | string     | null: false |
| exp_year    | string     | null: false |
| cvc         | string     | null: false |
| postal_code | string     | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| addresses   | integer    | null: false |
| building    | integer    | null: false |
| phone_num   | integer    | null: false |
| item        | references | null: false |
| sell_user   | references | null: false |
| buy_user    | references | null: false |

### Association

- has_many : buys
- has_many : items