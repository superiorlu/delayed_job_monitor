class WelcomeMailer < ApplicationMailer
  def welcome email = 'rubyist518@126.com'
    Rails.logger.info "send email.."
    mail(to: email, subject: "Welcome to OneApm!")
  end 
end
