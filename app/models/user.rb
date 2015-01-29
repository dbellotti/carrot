class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable, :trackable
  devise :database_authenticatable, :validatable

  def full_name
    [first_name, last_name].join(' ')
  end
end
