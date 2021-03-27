class User < ApplicationRecord

  has_secure_password
  has_one :doctor, class_name: 'Doctor', dependent: :destroy

  has_one_attached :avatar

  enum status: [ :sick, :no_vaccinated, :half_vaccinated, :vaccinated ]
  enum gender: [ :male, :female ]

  validates(
    :email,
    uniqueness: { case_sensitive: false },
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" }
  )

  def self.find_filtered(id)
    user = User.where(id: id).select(User.attribute_names - ['password_digest']).first
    user_attr = user.attributes
    user_attr[:avatar] = user.avatar.attached? ? Rails.application.routes.url_helpers.url_for(user.avatar) : ""

    user_attr
  end
end
