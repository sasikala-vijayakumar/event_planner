class ChangeDateAndTimeToDatetimeInParties < ActiveRecord::Migration[7.0]
  def change
    # Remove the old separate columns
    remove_column :parties, :date, :date
    remove_column :parties, :time, :time

    # Add a single datetime column
    add_column :parties, :date_time, :datetime
  end
end
