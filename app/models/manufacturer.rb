class Manufacturer < ActiveRecord::Base
  has_many :cars
  validates :name, presence: true
  validates :country, presence: true
  validates :country, uniqueness: { scope: :name } 
end
