class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username

  has_many :posts
  has_many :images, as: :imageable

  validates :email, :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
