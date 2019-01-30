class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User", validate: true

  before_create :set_published_at

  validates :author, :title, :body, presence: true

  protected

  def set_published_at
    self.published_at ||= Time.current
  end
end
