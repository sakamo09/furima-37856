# テーブル設計



## users テーブル
|Column              |Type   |Options                  |
|------------------- |------ |-------------------------|
| nickname           |string |null: false              |ニックネーム
| email              |string |null: false, unique: true|メールアドレス
| encrypted_password |string |null: false              |パスワード
| last_name          |string |null: false              |名字(全角）
| first_name         |string |null: false              |名前(全角）
| last_name_kana     |string |null: false              |名字(カナ）
| first_name_kana    |string |null: false              |名前(カナ）
| birthday           |date   |null: false              |生年月日

### Association
* has_many :product informations 
* has_many :purchase records 



## product informations テーブル
|Column           |Type      |Options                          |
|---------------- |----------|---------------------------------|
| name            |string    |null: false                      |商品の名前
| description     |text      |null: false                      |商品の説明
| category_id     |string    |null: false                      |商品のカテゴリー
| situation_id    |string    |null: false                      |商品の状態
| load_id         |string    |null: false                      |配送料の負担
| area_id         |integer   |null: false                      |発送元の地域
| period_id       |integer   |null: false                      |発送までの日数（期間）
| price           |integer   |null: false                      |商品の価格
| user            |references|null: false, foreign_key: true   |外部キー
### Association
- belongs_to :user 
- has_one :purchase records



## purchase records テーブル
|Column              |Type      |Options                        |
|--------------------|----------|-------------------------------|
| user               |references|null: false, foreign_key: true |外部キー
| product information|references|null: false, foreign_key: true |外部キー
### Association
belongs_to :user 
belongs_to :product information
has_one :shopping information


## shopping informationsテーブル
|Column           |Type       |Options                         |
|---------------- |---------- |--------------------------------|
| postal code     |string     |null: false                     |郵便番号
| area_id         |integer    |null: false                     |都道府県
| municipalities  |string     |null: false                     |市区町村
| address         |string     |null: false                     |番地
| building name   |string     |                                |建物名 
| telephone number|string     |null: false                     |電話番号
| purchase record |references |null: false, foreign_key: true  |外部キー
### Association
belongs_to :purchase record