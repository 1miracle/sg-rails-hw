class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title, :user_id

  belongs_to :user
  has_many :images, as: :imageable

  self.per_page = 3

  scope :published, -> { where('published_at IS NOT NULL') }
end
