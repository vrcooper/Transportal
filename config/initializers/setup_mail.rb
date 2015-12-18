if Rails.env.development? || Rails.env.production?

  ActionMailer::Base.smtp_settings = {
    port:          '587',
    address:       'smtp.mailgun.org',
    user_name:     ENV['MAILGUN_SMTP_LOGIN'],
    password:      ENV['MAILGUN_SMTP_PASSWORD'],
    domain:        'transportal.herokuapp.com',
    authentication :plain,
    content_type:   'text/html'
  }

  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.raise_delivery_errors = true
end