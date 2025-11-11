class CreateParties < ActiveRecord::Migration[7.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :description

      t.timestamps
    end
  end
end
