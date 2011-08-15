class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :uid
      t.string :screen_name
      t.string :service
      t.string :access_token
      t.string :access_secret
      t.trackable
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
