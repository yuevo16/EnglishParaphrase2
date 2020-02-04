## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :themes
- has_many :paraphrase
## themesテーブル
|Column|Type|Options|
|------|----|-------|
|question|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|paraphrase_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :paraphrase
## paraphraseテーブル
|Column|Type|Options|
|------|----|-------|
|answer|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|theme_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :theme