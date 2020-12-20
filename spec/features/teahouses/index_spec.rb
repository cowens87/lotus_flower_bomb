require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Teahouses Index Page' do
    before(:each) do
      @teahouse1 = create(:teahouse)
      @teahouse2 = create(:teahouse)
      @teahouse3 = create(:teahouse)
    end
    # 1-M User Story 1
    it 'I see the name of each teahouse in the system' do
      visit teahouses_path
      
      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse2.name)
    end
    # 1-M User Story 3
    it 'I see a link to create a new Teahouse record, "New Teahouse" that has me fill
        out and submit a form and then I am taken back to index page' do
      
      visit teahouses_path
      
      expect(page).to have_link('New Teahouse')
      
      click_on 'New Teahouse'

      expect(current_path).to eq(new_teahouse_path)

      fill_in 'Name:', with: "#{@teahouse1.name}"
      fill_in 'Address:', with: "#{@teahouse1.address}"
      fill_in 'City:', with: "#{@teahouse1.city}"
      fill_in 'State:', with: "#{@teahouse1.state}"
      fill_in 'Zip:', with: @teahouse1.zip

      click_on 'Create Teahouse'

      expect(current_path).to eq(teahouses_path)

      expect(page).to have_content("#{@teahouse1.name}")
    end
  end
end