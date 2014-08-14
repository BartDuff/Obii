class AddIndexToObiisImage < ActiveRecord::Migration
  def change
      add_index :obiis, :image, unique: true
  end
end
