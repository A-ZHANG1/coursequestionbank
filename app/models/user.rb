class User < ActiveRecord::Base
  attr_accessible :name, :username, :uid, :provider, :provider_image, :provider_email, :privilege

  def self.dev_users
    where(:provider => "developer")
  end

  def admin?
    privilege == "admin"
  end

  def instructor?
    privilege == "instructor"
  end

  def student?
    privilege == "student"
  end
end
