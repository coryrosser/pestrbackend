class User < ApplicationRecord
    has_many :groupmembers
    has_many :issues
    has_many :groups, through: :groupmembers
    has_many :updates

    has_secure_password
end
