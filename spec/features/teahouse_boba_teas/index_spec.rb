require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a Teahous Boba Teas Index Page' do
    before(:each) do
      @teahouse1    = create(:teahouse)
      @teahouse2    = create(:teahouse)
      @thai_boba    = create(:boba_tea, teahouse_id: @teahouse1.id)
      @cherry_berry = create(:boba_tea, name: 'Cherry Berry', teahouse_id: @teahouse2.id)
      @bananamo     = create(:boba_tea, name: 'Bananamo', teahouse_id: @teahouse2.id)
      @coquito      = create(:boba_tea, name: 'Coquito', teahouse_id: @teahouse2.id)
    end
    # 1-M User Story 7
    it 'I see each Boba tea that is associated with that Teahouse with each Boba Teas attributes' do
      visit teahouse_boba_teas_path(@teahouse1.id)
      
      expect(page).to have_content(@thai_boba.name)
      expect(page).to have_content(@thai_boba.price)
      expect(page).to have_content(@thai_boba.base)
      expect(page).to have_content(@thai_boba.caffeinated)
      expect(page).to have_content(@thai_boba.description)
    end
    # 1-M User Story 9
    it 'I see a link to add a new tea for that teahouse, once added I return to all teahouses boba teas' do
      visit teahouse_boba_teas_path(@teahouse2.id)
      
      expect(page).to have_link('Add Boba Tea')
      
      click_on 'Add Boba Tea'

      expect(current_path).to eq(new_teahouse_boba_teas_path(@teahouse2.id))

      fill_in 'Name:', with: "Mango-Tango Boba"
      fill_in 'Price:', with: "5.42"
      fill_in 'Base:', with: "Black Tea"
      fill_in 'Description:', with: "Mango flavor bursting with tango"
      check 'Caffeinated?'

      click_on 'Submit'

      expect(current_path).to eq(teahouse_boba_teas_path(@teahouse2.id))

      expect(page).to have_content("Mango-Tango Boba")
    end
    # 1-M User Story 13
    it 'I see a count of the number of boba teas associated with this teahouse' do
      visit teahouse_boba_teas_path(@teahouse2.id)
      
      expect(page).to have_content("Number of Boba Teas: #{@teahouse2.boba_teas.count}")
    end
    # 1-M User Story 17
    it 'I see a link to sort the boba teas in alphabetical order' do
      visit teahouse_boba_teas_path(@teahouse2.id)

      expect(page).to have_link('Sort Tea Name by Alpha')
      
      click_link 'Sort Tea Name by Alpha'

      expect(current_path).to eq(teahouse_boba_teas_path(@teahouse2.id))
      expect(@cherry_berry.name).to appear_before(@coquito.name)
      expect(@bananamo.name).to appear_before(@coquito.name)
      expect(@cherry_berry.name).to_not appear_before(@bananamo.name)
      expect(@coquito.name).to_not appear_before(@bananamo.name)
      expect(@coquito.name).to_not appear_before(@cherry_berry.name)
    end
  end
end