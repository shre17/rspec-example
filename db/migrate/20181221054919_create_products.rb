class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :status
      t.string :price
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
