class Teahouse < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :boba_teas, dependent: :destroy
end
