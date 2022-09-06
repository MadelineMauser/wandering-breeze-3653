require 'rails_helper'


RSpec.describe ContestantProject, type: :model do
  describe "relationships" do
    it {should belong_to :contestant}
    it {should belong_to :project}
  end

  describe 'class methods' do
    describe '#contestant_project_names' do
      it 'should return a comma-separated list of project names for a contestant' do
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
        @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

        ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
        ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)

        expect(ContestantProject.contestant_project_names(@jay.id)).to eq("Litfit, News Chic")
      end
    end
    describe '#project_contestant_count' do
      it 'should return a count of contestants for a project' do
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @lit_fit.id)

        expect(ContestantProject.project_contestant_count(@lit_fit.id)).to eq(2)
      end
    end
  end
end
