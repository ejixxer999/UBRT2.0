class Company < ApplicationRecord
    has_many :jobsites
    has_many :users, through: :jobsites
end
