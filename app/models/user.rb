class User < ApplicationRecord
    validates :first_name, :last_name, presence: true 

    has_many :appointments, dependent: :destroy
    has_many :doctors, through: :appointments

    def user_full_name
        "#{self.first_name} #{self.last_name}"
    end
end
