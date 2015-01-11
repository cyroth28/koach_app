class CreateSessionTokens < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token,      null: false
      t.references :sessionable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
