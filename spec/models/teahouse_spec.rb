require 'rails_helper'

RSpec.describe Teahouse, type: :model do
  before(:each) do
    @teahouse   = create(:teahouse)
    @lemon_pina = create(:boba_tea, teahouse_id: @teahouse.id)
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

  # describe 'Teahouse count of boba teas' do
  #   it 'Knows the number of boba teas' do
  #     expect(@teahouse.boba_count).to eq(1)
  #   end
  # end 
end
