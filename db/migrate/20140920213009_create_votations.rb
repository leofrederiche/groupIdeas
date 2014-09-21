class CreateVotations < ActiveRecord::Migration
  def change
    create_table :votations do |t|
      t.integer :id_idea
      t.integer :id_user
      t.boolean :votation

      t.timestamps
    end
  end
end
