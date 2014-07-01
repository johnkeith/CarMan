class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :year,
    presence: true,
    numericality: {
      greater_than: 1920,
      less_than: Time.now.year,
      integer: true
    }
  validates :mileage,
    presence: true,
    numericality: true
end
