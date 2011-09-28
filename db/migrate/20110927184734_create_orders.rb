class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
		t.string :title
		t.integer :category_id
		t.integer :installation_id
		t.integer :status_id
		t.float :quantity
		t.text :description
		
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
