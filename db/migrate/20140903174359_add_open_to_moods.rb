class AddOpenToMoods < ActiveRecord::Migration
  def change
      add_column :moods, :open, :boolean, default: true
  end
end
