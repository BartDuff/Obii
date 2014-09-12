class CreateHangouts < ActiveRecord::Migration
  def change
    create_table :hangouts do |t|
      t.belongs_to :user
      t.belongs_to :mood
      t.boolean :accept, default: false
      t.timestamps
      
    end
    add_index :hangouts, [:user_id, :mood_id], unique: true
  end
end
