class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username

  has_many :posts
  has_many :images, as: :imageable
end
