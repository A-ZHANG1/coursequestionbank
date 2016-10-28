class CreateUserTable < ActiveRecord::Migration
  def up
    create_table :users do |user|
      user.string :name
      user.string :username
      user.string :uid
      user.string :provider, :default => 'github'
      user.string :provider_image, :default => nil
      user.string :provider_email, :default => nil
      user.timestamps
    end
  end

  def down
    drop_table :users
  end
end
