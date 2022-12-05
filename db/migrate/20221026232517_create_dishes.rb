class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :hall
      t.string :property
      t.integer :calories
      t.string :image
    end
  end
end
