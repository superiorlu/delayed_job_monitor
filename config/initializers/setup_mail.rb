ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:              'smtp.sina.com',
    domain:               'sina.com',
    user_name:            'oneapm',
    password:             'oneapm123',
    authentication:       'plain',
    enable_starttls_auto: true  
}
