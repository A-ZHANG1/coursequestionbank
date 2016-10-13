Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "c512675842209fc24985", "179bf35c8b405a00419f0a1dc1f1e4ab4a77fed9"
  if Rails.env.development? or Rails.env.test?
    provider :developer, :fields => [:uid], :uid_field => [:uid]
    # see seeds.rb for available :developer logins
    SessionController.skip_before_filter :verify_authenticity_token, only: :create # to avoid problems when testing with SSL turned on with OmniAuth Developer strategy
  end
end
