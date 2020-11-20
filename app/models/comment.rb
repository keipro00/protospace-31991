class Comment < ApplicationRecord

  # belongs_toは単数なので、単数形で記述すること
  belongs_to :user
  belongs_to :prototype
  
  validates :text, presence: true

end
