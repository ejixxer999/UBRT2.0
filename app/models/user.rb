class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    has_many :jobsites
    has_many :companies, through: :jobsites

end
