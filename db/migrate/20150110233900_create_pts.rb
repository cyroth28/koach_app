class CreatePts < ActiveRecord::Migration
  def change
    create_table :pts do |t|
      t.string :name,            null: false
      t.string :phone_number,    null: false
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.boolean :admin,          default: false
      t.integer :clinic_id,       null: false

      t.timestamps
    end
    add_index :pts, :email, unique: true
    add_index :pts, :clinic_id
  end
end
