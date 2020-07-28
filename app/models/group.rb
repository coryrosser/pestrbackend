class Group < ApplicationRecord
  belongs_to :user
  has_many :groupmembers
  has_many :users, through: :groupmembers
  has_many :issues
  has_many :updates, through: :issues
end
