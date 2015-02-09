class HomeController < ApplicationController

  def index
  end

  def add_user
    user = User.create(email: params[:email], password: generate_password)

    if user.valid?
      WelcomeMailer.invite(user.email).deliver_now
      flash[:notice] = 'user added'
    else
      flash[:alert] = user.errors.full_messages
    end

    redirect_to root_path
  end

  def send_carrot
    user_1, user_2 = pull_two_users
    deliver_carrot_email(user_1, user_2)

    redirect_to root_path, notice: 'carrot sent'
  end

  private

  def deliver_carrot_email(email_1, email_2)
    ConnectionMailer.initiate(email_1, email_2).deliver_now
  end

  def generate_password
    Devise.friendly_token.first(8)
  end

  def pull_two_users
    User.order(:email).limit(2)
  end
end
