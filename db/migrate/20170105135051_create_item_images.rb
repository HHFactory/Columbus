class CreateItemImages < ActiveRecord::Migration
  def change
    create_table :item_images do |t|
      t.string :url_path, null:false
      t.string :division, null:false
      t.timestamps null: false
      t.belongs_to :item
    end

    create_table :item_user_links do |t|
      t.belongs_to :item
      t.belongs_to :user
    end
  end
end
