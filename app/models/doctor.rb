class Doctor < ApplicationRecord
    validates :first_name, :last_name, presence: true 
    
    has_many :appointments
end
