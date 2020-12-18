require 'rails_helper'

RSpec.describe BobaTea, type: :model do
  before(:each) do
    @boba_tea = create(:boba_tea)
  end 

  describe 'validations' do
    it { should validate_presence_of :image}
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
    it { should validate_presence_of :type}
    it { should validate_presence_of :description}
  end

  describe 'relationships' do
    it {should belong_to :teahouse}
    it {should have_many :boba_tea_requests}
    it {should have_many(:requests).through(:boba_tea_requests)}
  end
end