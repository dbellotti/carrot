class HomeController < ApplicationController

  def index
  end

  def add_user
    if params.has_key?(:email)
      user = User.create(email: params[:email], password: generate_password)
      WelcomeMailer.invite(user.email).deliver_now
    end

    redirect_to root_path, notice: 'user added'
  end

  private

  def generate_password
    Devise.friendly_token.first(8)
  end
end
