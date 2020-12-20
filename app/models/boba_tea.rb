class BobaTea < ApplicationRecord
  belongs_to :teahouse
  has_many :boba_tea_requests, dependent: :destroy
  has_many :requests, through: :boba_tea_requests
  
  validates_presence_of :name, :price, :base, :description
  validates_inclusion_of :caffeinated, in: [true, false]
end
