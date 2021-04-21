class User < ApplicationRecord
  has_many :talks, foreign_key: "author_id"
end
