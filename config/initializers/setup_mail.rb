ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => ENV["MAILER_SETTINGS_ADDRESS"],
  :port => 587,
  :enable_starttls_auto => true,
  :user_name => ENV["MAILER_SETTINGS_USER"],
  :password => ENV["MAILER_SETTINGS_PASSWORD"],
  :authentication => :login
}
