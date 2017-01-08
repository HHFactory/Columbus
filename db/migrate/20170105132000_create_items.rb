# create items table
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :status, null:false
      t.datetime :pick_date, null:false
      t.string :characteristic, null:false
      t.string :pick_location, null:false
      t.string :manage_location, null:false
      t.timestamps null:false
      t.references :item_image
    end
  end
end
