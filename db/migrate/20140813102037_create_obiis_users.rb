class CreateObiisUsers < ActiveRecord::Migration
  def change
      create_table :obiis_users, :id => false do |t|
          t.belongs_to :obii
          t.belongs_to :user
    end
  end
end
