require 'rails_helper'

RSpec.describe Teahouse, type: :model do
  before(:each) do
    @teahouse = create(:teahouse)
  end 

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :city}
    it { should validate_presence_of :state}
    it { should validate_presence_of :zip}
  end

  describe 'relationships' do
    it {should have_many :boba_teas}
  end
end
