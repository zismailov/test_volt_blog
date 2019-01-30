class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "author_id", dependent: :destroy
  has_many :comments, foreign_key: "author_id", dependent: :destroy

  validates :nickname, :password, :email, presence: true
  validates :email, email: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_attached_file :avatar,
    styles: { thumb: "300x300#" },
    default_url: "http://csgobuff.pro/img/empty-avatar.jpg",
    storage: :s3,
    s3_credentials:
    {
      bucket:            Rails.configuration.service["bucket"],
      access_key_id:     Rails.configuration.service["access_key_id"],
      secret_access_key: Rails.configuration.service["secret_access_key"]
    },
    s3_region:            "eu-central-1",
    s3_host_name:         "s3.eu-central-1.amazonaws.com",
    s3_permissions:       "public-read",
    use_default_time_zone: false

  validates_attachment :avatar,
    content_type: { content_type: /\Aimage\/.*\z/ },
    file_name:    { matches: [/png\z/, /jpe?g\z/] },
    size:         { less_than: 3.megabytes }
end
