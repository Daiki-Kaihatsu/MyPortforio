class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image 
  has_many :boards, dependent: :destroy
  has_many :favorites,dependent: :destroy       
  has_many :comments
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  def already_favorited?(board)
    self.favorites.exists?(board_id: board.id)
  end
  
end
