class CreateTrusties < ActiveRecord::Migration[7.1]
  def change
    create_table :trusties do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
