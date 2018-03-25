class User < ApplicationRecord
  attr_accessor :remember_token
before_save {self.email = email.downcase}
has_many :recipes
has_many :fridges
validates :first_name, presence: true
validates :last_name, presence: true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with:VALID_EMAIL_REGEX }, uniqueness: { case_senstive: false }
has_secure_password

accepts_nested_attributes_for :fridges, reject_if: :all_blank, allow_destroy: true

def self.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

def self.new_token
  SecureRandom.urlsafe_base64
end

def remember
  self.remember_token = User.new_token
  update_attribute(:remember_digest, User.digest(remember_token))
end

def authenticate?(remember_token)
  if remember_digest.nil?
    return false 
  else
  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end

def forget
   update_attribute(:remember_digest, nil)
end

end
