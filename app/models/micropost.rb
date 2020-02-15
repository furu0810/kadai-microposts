class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 250}
  
 #お気に入りされているmicropostとユーザーの関係
  has_many :favorites
  has_many :users, through: :favorites, source: :user
  
  def likes(other_micropost)
    unless self == other_micropost
     self.favorites.find_or_create_by(micropost_id: other_micropost.id)
    end
  end
  
  def unlike(other_micropost)
    favorite = self.favorites.find_by(micropost_id: other_micropost.id)
    favorite.destroy if favorite
  end
  
  def likes?(other_micropost)
    self.favorites.include(other_micropost)
  end
      
end

