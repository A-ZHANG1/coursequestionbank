class User < ActiveRecord::Base
  attr_accessible :name, :username, :uid, :provider, :provider_image, :provider_email, :privilege

  def initialize(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if auth["info"]["name"] and !auth["info"]["name"].empty?
        user.name = auth["info"]["name"]
      else
        user.name = auth["info"]["nickname"]
      end
      user.username = auth["info"]["nickname"]
      user.provider_image = auth["info"]["image"]
      user.provider_email = auth["info"]["email"]
    end
  end
end
