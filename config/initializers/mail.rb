ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :address => "mail.authsmtp.com",
 :domain => "5palabritas.com",
 :port => 23,
 :authentication => :login,
 :user_name => "ac36117",
 :password => "avru3dfnr" }
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf-8"