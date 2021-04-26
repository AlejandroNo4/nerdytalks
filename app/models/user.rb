class User < ApplicationRecord
  has_many :talks, foreign_key: "author_id"

  has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
  has_many :followeds, foreign_key: 'followed_id', class_name: 'Following'

  validates :username, presence: true, length: { maximum: 25}

  has_one_attached :photo
  has_one_attached :cover_image
  def followeds_id
    followeds.map {|f| f.follower_id}.compact
  end

  def followers_id
    followers.map {|f| f.followed_id}.compact
  end
  
  def followed?(user)
    followeds_id.include?(user.id)
  end
end

