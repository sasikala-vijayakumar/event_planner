class Attendee < ApplicationRecord
  belongs_to :party

  validates :full_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A[0-9+\-\s]+\z/, message: "only allows numbers, +, - and spaces" }
end
