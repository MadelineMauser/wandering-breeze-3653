require 'rails_helper'

RSpec.describe 'project show page' do
  describe 'content' do
    before :all do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @lit_fit.id)
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
    it 'should have a count of contestants on this project' do
      visit "/projects/#{@lit_fit.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end
  end
end
