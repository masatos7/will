class AdminUser < ActiveRecord::Base

  has_secure_password
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
end
