class User < ActiveRecord::Base

  has_secure_password

  has_many :your_wills

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :interval
  validates_presence_of :count
  validates_confirmation_of :password
end
