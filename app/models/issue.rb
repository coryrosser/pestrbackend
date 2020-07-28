class Issue < ApplicationRecord
  belongs_to :group
  belongs_to :creator
  belongs_to :assigned_user
end
