class Jobsite < ApplicationRecord
    belongs_to :user
    belongs_to :company
    validates :name, presence: true
    validates :location, presence: true


end
