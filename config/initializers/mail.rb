ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :address => "mail.authsmtp.com",
 :domain => "5palabritas.com",
 :port => 25,
 :authentication => :login,
 :user_name => "ac54774",
 :password => "awzntam8xekwcd",
 :openssl_verify_mode => 'none',
 :enable_starttls_auto => false,
 :tls => false }
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf-8"
