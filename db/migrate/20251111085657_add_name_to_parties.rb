class AddNameToParties < ActiveRecord::Migration[7.2]
  def change
    add_column :parties, :name, :string
  end
end
