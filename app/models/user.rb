require 'bcrypt'

class User < ActiveRecord::Base


  has_many :cats,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "Cat"

  has_many :requests,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "CatRentalRequest"

  validates :user_name, :password_digest, :session_token, presence: true
  validates :password, length: { minimum:6, allow_nil: true }
  validates :session_token, uniqueness: true

  attr_reader :password

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    var = BCrypt::Password.create(password)
    self.password_digest = var
  end

  def is_password?(password)
    new_password_check = BCrypt::Password.new(self.password_digest)
    new_password_check.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    potential_user = User.find_by({user_name: user_name})
    return nil unless potential_user

    potential_user.is_password?(password) ? potential_user : nil
  end


end
