class User < ApplicationRecord
  has_many :talks, foreign_key: "author_id"

  has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
  has_many :followeds, foreign_key: 'followed_id', class_name: 'Following'
end
