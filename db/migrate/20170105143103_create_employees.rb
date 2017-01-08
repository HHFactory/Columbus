class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null:false
      t.string :tel_num
      t.belongs_to :department
    end
  end
end
