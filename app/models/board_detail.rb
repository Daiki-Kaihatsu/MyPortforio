class BoardDetail < ApplicationRecord
  belongs_to :board
  attachment :image
end
