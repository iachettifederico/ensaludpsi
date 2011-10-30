ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "iachetti.federico",
  :password             => "ecofield1235",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
