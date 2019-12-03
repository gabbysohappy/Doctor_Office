class AddUserIdAndDoctorIdToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :user, null: false, foreign_key: true
    add_reference :appointments, :doctor, null: false, foreign_key: true
  end
end
