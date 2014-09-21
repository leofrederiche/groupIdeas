class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :id_user
      t.integer :id_idea
      t.boolean :approved

      t.timestamps
    end
  end
end
