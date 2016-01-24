class CreateDrummers < ActiveRecord::Migration
  def change
    create_table :drummers do |t|
      t.string :name
      t.string :picture

      t.timestamps null: false
    end
  end
end
