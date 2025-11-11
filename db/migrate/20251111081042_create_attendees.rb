class CreateAttendees < ActiveRecord::Migration[7.2]
  def change
    create_table :attendees do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
