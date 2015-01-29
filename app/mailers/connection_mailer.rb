class ConnectionMailer < ApplicationMailer

  def initiate(user_1, user_2)
    @user_1 = user_1
    @user_2 = user_2

    mail(to: [user_1.email, user_2.email],
         subject: "Proposed Carrot for #{user_1.full_name} and #{user_2.full_name}")
  end
end
