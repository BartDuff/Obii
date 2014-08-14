class AddIndexToObiisName < ActiveRecord::Migration
  def change
      add_index :obiis, :name, unique: true
  end
end
