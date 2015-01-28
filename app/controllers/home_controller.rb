class HomeController < ApplicationController

  def index
    WelcomeMailer.invite('dbellotti@pivotal.io').deliver_now
  end
end
