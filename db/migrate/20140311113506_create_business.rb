class CreateBusiness < ActiveRecord::Migration
  def up
    create_table :businesses do |t|
      t.string :name, :null => false
    end
  end

  def down
    drop_table :businesses
  end
end
