class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :idea
      t.integer :idealizer
      t.integer :like
      t.integer :nlike
      t.string :link
      t.string :github

      t.timestamps
    end
  end
end
