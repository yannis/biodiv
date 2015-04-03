class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
end
