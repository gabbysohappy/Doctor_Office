class Doctor < ApplicationRecord
    validates :first_name, :last_name, presence: true 
    
    has_many :appointments

    def doctor_full_name
        "#{self.first_name} #{self.last_name}"
    end

end
