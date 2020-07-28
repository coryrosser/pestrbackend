class User < ApplicationRecord
    has_many :groupmembers
    has_many :issues, :foreign_key => 'creator_id'
    has_many :issues, :foreign_key => 'assigned_user_id'
    has_many :groups, through: :groupmembers
    has_many :updates

    has_secure_password
end
