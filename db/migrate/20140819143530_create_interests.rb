class CreateInterests < ActiveRecord::Migration
  def change
      create_table :interests do |t|
          t.belongs_to :obii
          t.belongs_to :user
          
      t.timestamps
    end
      add_index :interests, [:obii_id, :user_id], :unique => true
  end
end
