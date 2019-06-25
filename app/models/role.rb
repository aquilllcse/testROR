class Role < ApplicationRecord
    has_many :users
    validates :name, presence: true
   
    def available_role
        ["PM","ADMIN"]
    end
end