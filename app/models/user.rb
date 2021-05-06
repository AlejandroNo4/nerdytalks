class User < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  has_many :talks, foreign_key: 'author_id', dependent: :destroy
  has_many :followers, foreign_key: 'follower_id', class_name: 'Following', dependent: :destroy
  has_many :followeds, foreign_key: 'followed_id', class_name: 'Following', dependent: :destroy

  validates :username, presence: true, length: { maximum: 25 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }, uniqueness: true
  validates :full_name, presence: true, length: { maximum: 25 }
  validates :photo, presence: true
  validates :cover_image, presence: true

  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy

  def followeds_id
    followeds.map(&:follower_id).compact
  end

  def followed?(user)
    followeds_id.include?(user.id)
  end
end
