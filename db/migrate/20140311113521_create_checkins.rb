class CreateCheckins < ActiveRecord::Migration
  def up
    create_table :checkins do |t|
      t.integer :user_id, :null => false
      t.integer :business_id, :null => false
      t.date :checkin_date, :null => :false
    end
  end

  def down
    drop_table :checkins
  end
end
