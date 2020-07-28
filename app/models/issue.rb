class Issue < ApplicationRecord
  belongs_to :group
  belongs_to :creator, class_name: :User
  belongs_to :assigned_user, class_name: :User
  has_many :updates
end
