class Prototype < ApplicationRecord

  #(発展)テーブル同士を紐付けるためにアソシエーションを記述
  # 注意：has_manyは複数形で記述、belongs_toは単数形で記述
  has_many :comments
  belongs_to :user

  #(発展)imageファイルとひもづけるために記述
  has_one_attached :image

  #一定の制約を設けるバリデーションを記述
  # 今回は空のデータが登録できないようにする
  
  validates :title,      presence: true
  validates :catch_copy, presence: true
  validates :concept,    presence: true
  validates :image,      presence: true

  
  
end
