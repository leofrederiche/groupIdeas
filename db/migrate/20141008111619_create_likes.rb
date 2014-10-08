class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :id_from
      t.integer :id_by
      t.boolean :opinion

      t.timestamps
    end
  end
end
