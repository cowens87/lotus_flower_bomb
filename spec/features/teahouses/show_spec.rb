require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Teahouse Show Page' do
    before(:each) do
      @teahouse1 = create(:teahouse)
      @teahouse2 = create(:teahouse)
    end
    # 1-M User Story 2
    it 'I see the teahouse with that id and their attributes' do
      visit teahouse_path(@teahouse1.id)

      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse1.address)
      expect(page).to have_content(@teahouse1.city)
      expect(page).to have_content(@teahouse1.state)
      expect(page).to have_content(@teahouse1.zip)
    end
    # 1-M User Story 4
    it 'I see a link to edit the teahouse info and once edited returns to the show page' do
      visit teahouse_path(@teahouse1.id)

      expect(page).to have_content(@teahouse1.address)
      expect(page).to have_link('Update Teahouse')
      
      click_on 'Update Teahouse'

      expect(current_path).to eq(edit_teahouse_path(@teahouse1.id))

      fill_in 'Address:', with: "1234 Boba Tea Lane"
      click_on 'Submit'

      expect(current_path).to eq(teahouse_path(@teahouse1.id))

      expect(page).to have_content("1234 Boba Tea Lane")
    end
  end
end