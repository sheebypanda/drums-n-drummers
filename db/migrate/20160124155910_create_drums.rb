class CreateDrums < ActiveRecord::Migration
  def change
    create_table :drums do |t|
      t.string :picture
      t.references :drummer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
