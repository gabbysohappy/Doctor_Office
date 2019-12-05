class ChangeTimeToBeTimeInAppointments < ActiveRecord::Migration[6.0]
  def change
    change_column :appointments, :time, :time
    add_column :appointments, :date, :date
  end
end
