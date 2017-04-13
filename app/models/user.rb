class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :password_confirmation, :username

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password

  has_many :posts
  has_many :images, as: :imageable

  validates :email, :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, presence: true, confirmation: true

  scope :adults, -> { where('birthday <= ?', 18.years.ago) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
