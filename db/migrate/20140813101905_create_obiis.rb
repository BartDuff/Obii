class CreateObiis < ActiveRecord::Migration
  def change
    create_table :obiis do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
