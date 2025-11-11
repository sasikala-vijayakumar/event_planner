class Attendee < ApplicationRecord
  belongs_to :party

  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
