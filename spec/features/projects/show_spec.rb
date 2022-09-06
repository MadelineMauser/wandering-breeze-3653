require 'rails_helper'

RSpec.describe 'project show page' do
  describe 'content' do
    before :all do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    end
    it 'should have the project name' do
    end
    it 'should have the project material' do
    end
    it 'should have the project theme' do
    end
  end
end
