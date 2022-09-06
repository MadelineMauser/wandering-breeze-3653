require 'rails_helper'

RSpec.describe 'project show page' do
  describe 'content' do
    before :all do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    end
    it 'should have the project name' do
      visit "/projects/#{@lit_fit.id}"

      expect(page).to have_content("Litfit")
    end
    it 'should have the project material' do
      visit "/projects/#{@lit_fit.id}"

      expect(page).to have_content("Material: Lamp")
    end
    it 'should have the project theme' do
      visit "/projects/#{@lit_fit.id}"

      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end
  end
end
