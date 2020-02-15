class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 250}
  
 #お気に入りされているmicropostとユーザーの関係
  has_many :favorites
  has_many :users, through: :favorites, source: :user
  
 
      
end

