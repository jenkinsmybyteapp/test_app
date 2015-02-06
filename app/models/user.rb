class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
  has_many :tickets
  has_many :replies
  # test push event
  # test push event
end
