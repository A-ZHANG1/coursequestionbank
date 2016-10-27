class User < ActiveRecord::Base
  attr_accessible :name, :username, :uid, :provider, :provider_image, :provider_email, :privilege

  def self.dev_users
    where(:provider => "developer")
  end

  def admin?
    privilege == "Admin"
  end

  def instructor?
    privilege == "Instructor"
  end

  def student?
    privilege == "Student"
  end
end
