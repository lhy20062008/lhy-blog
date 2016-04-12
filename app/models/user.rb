class User < ActiveRecord::Base
  #系统中默认初始化一个系统用户, 所有系统出发的操作, user_id 都绑定上去 SYSTD
  attr_accessor :password
  validates :name, :email, presence: true
  validates :email, uniqueness: {message: 'Email地址不能重复'}

 
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
