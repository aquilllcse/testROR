class Role < ApplicationRecord
    has_many :users
    validates :name, presence: true
   
    def giver
        ["PM","ADMIN"]
    end
end