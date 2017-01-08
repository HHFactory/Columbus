class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :tel_num
      t.string :mail_address
      t.string :line_id
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :address_other
      t.timestamps null: false
    end
  end
end
