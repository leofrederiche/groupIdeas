class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id_idea
      t.integer :id_user
      t.string :comment

      t.timestamps
    end
  end
end
