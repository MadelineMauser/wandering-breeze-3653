require 'rails_helper'

RSpec.describe 'contestant index page' do
  describe 'content' do
    before :all do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    end
    it 'should have the names of every contestant' do
      visit "/contestants"

      within("#contestant_#{@jay.id}") do
        expect(page).to have_content("Jay McCarroll")
      end

      within("#contestant_#{@gretchen.id}") do
        expect(page).to have_content("Gretchen Jones")
      end
    end
    it 'should have a list of projects each contestant has worked on under their name' do
      visit "/contestants"

      within("#contestant_#{@jay.id}") do
        expect(page).to have_content("Projects: Litfit, News Chic")
      end

      within("#contestant_#{@gretchen.id}") do
        expect(page).to have_content("Projects: Upholstery Tuxedo")
      end
    end
  end
end
