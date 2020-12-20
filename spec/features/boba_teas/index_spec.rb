require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Boba Teas Index Page' do
    before(:each) do
      @teahouse1    = create(:teahouse)
      @teahouse2    = create(:teahouse)
      @thai_boba    = create(:boba_tea, teahouse_id: @teahouse1.id)
      @cherry_berry = create(:boba_tea, teahouse_id: @teahouse2.id)
    end
    # 1-M User Story 6
    it 'I see each Boba tea in the system including the attributes' do
      visit boba_teas_path 

      expect(page).to have_content(@thai_boba.name)
      expect(page).to have_content(@thai_boba.price)
      expect(page).to have_content(@thai_boba.base)
      expect(page).to have_content(@thai_boba.caffeinated)
      expect(page).to have_content(@thai_boba.description)
      expect(page).to have_content(@cherry_berry.name)
      expect(page).to have_content(@cherry_berry.price)
      expect(page).to have_content(@cherry_berry.base)
      expect(page).to have_content(@cherry_berry.caffeinated)
      expect(page).to have_content(@cherry_berry.description)
    end
  end 
end