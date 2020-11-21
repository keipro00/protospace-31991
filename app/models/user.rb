class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #(発展)ここへアソシエーションを記述 
  has_many :prototypes
  has_many :comments 

         #(発展)ここへ一定の制約をかけるバリデーションを記述
         #emailとpasswordはデフォルトで入っているので記述不要
  validates :name,       presence: true
  validates :profile,    presence: true
  validates :occupation, presence: true
  validates :position,   presence: true

end
