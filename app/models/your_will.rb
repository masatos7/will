class YourWill < ActiveRecord::Base
	belongs_to :user

    validates_presence_of :email
    validates_presence_of :content
end
