class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "author_id", dependent: :destroy, inverse_of: :user
  has_many :comments, foreign_key: "author_id", dependent: :destroy, inverse_of: :user

  validates :nickname, :password, :email, presence: true
  validates :email, email: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
end
