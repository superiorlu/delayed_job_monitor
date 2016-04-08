class WelcomeMailer < ApplicationMailer
  def welcome email = 'luyignrui@oneapm.com'
    Rails.logger.info "send email.."
    mail(to: email, subject: "Welcome to OneApm!")
  end 
end
