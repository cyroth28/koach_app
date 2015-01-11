class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name,            null: false
      t.string :phone_number,    null: false
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.string :diagnosis

      t.timestamps
    end
    add_index :patients, :email, unique: true
  end
end
