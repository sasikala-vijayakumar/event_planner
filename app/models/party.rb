class Party < ApplicationRecord
  has_many :attendees, dependent: :destroy

  validates :title, presence: true
  validates :date_time, presence: true
end
