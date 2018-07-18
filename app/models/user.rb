class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[bitbucket]

  def email_required?
    false
  end

  def password_required?
    email.present? && uid.blank? && provider.blank?
  end
end
