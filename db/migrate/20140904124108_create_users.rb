class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :description
      t.string :acquiriments
      t.string :web
      t.string :facebook

      t.timestamps
    end
  end
end
