class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :country, presence: true
  validates :country, uniqueness: { scope: :name } 
end
