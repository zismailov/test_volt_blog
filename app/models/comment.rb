class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: "User", validate: true

  validates :author, :post, :body, presence: true
end
