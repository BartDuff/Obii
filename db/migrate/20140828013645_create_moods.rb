class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.belongs_to :user
      t.belongs_to :obii
      t.integer :maxgroup
      t.integer :mingroup
      t.datetime :starts
      t.datetime :ends

      t.timestamps
    end
  end
end
