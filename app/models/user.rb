class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: {message: 'Email地址不能重复'}

  has_one :post
  has_many :articles

  attr_accessor :password, :password_confirmation
 
  before_save :encrypt_password

  def self.authenticate(email, password)
    user = self.find_by(email: email)
    if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
      return user
    else
      return false
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt if self.salt.blank?
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end
