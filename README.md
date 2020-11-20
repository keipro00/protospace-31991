# テーブル設計



## usersテーブル
## occupation→職業
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

## Association
   # Associationはテーブル同士の関連付けのこと、モデルに定義することで別のモデルへアクセス可

has_many :prototypes
has_many :comments
   # has_manyは、複数個のつながりがある状態

## prototypesテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| catch_copy | text       | null: false |
| concept    | text       | null: false |
| user       | references |             |

# imageはActiveStorageで実装

## Association
has_many :comments
belongs_to :user
 # belongs_toは、ひとつのつながりの状態

## commentsテーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
|text       | text       | null: false |
| user      | references |             |
| prototype | references |             |

## Association
belongs_to :user
belongs_to :prototype