class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  
  has_many :answers, dependent: :destroy
end
