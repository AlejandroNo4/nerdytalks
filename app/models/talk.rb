class Talk < ApplicationRecord
  belongs_to :author, class_name: :User
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 140}
end
