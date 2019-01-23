class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admin_email, -> { where(admin: true).pluck(:email) }
end
