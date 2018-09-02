class User < ActiveRecord::Base
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
  has_many :notes


end
