class CreateInstallations < ActiveRecord::Migration
  def self.up
    create_table :installations do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :release_date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :installations
  end
end
