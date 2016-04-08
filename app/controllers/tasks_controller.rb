class TasksController < ApplicationController
 
  def index
  end

  def todo
    email = params[:m] || "luyingrui@oneapm.com"
    case params[:t]
    when "slow" then SlowJob.set(wait: 5.seconds, queue: :slow).perform_later;
    when "exception" then ExceptionJob.set(wait: 5.seconds, queue: :exception).perform_later;
    else WelcomeMailer.welcome(email).deliver_later(wait: 2.seconds, queue: :mailer)
    end
    render nothing: true;
  end
end
