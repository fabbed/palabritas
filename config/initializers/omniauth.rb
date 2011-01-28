require 'ostruct'
facebook_config = YAML.load_file("#{Rails.root}/config/facebook.yml")
FacebookConfig = OpenStruct.new facebook_config[RAILS_ENV]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FacebookConfig.key, FacebookConfig.secret, {:scope => FacebookConfig.scope } #http://5palabritas.local:3000/
end
