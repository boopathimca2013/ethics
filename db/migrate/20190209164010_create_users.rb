class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :male_name
      t.string :female_name
      t.string :address
      t.string :ipaddress
      t.string :latitude
      t.string :logitude
      t.integer :repeat_count

      t.timestamps
    end
  end
end
