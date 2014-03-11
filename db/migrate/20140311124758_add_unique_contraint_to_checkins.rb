class AddUniqueContraintToCheckins < ActiveRecord::Migration
  def up
    add_index :checkins, [:user_id, :business_id, :checkin_date], :unique => true, :name => 'unique_checkins_index'
  end

  def down
    remove_index :checkins, :name => 'unique_checkins_index'
  end
end
