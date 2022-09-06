class ContestantProject < ApplicationRecord
belongs_to :contestant
belongs_to :project

  def self.contestant_project_names(contestant_id)
    Project.joins(:contestant_projects).where(contestant_projects: {contestant_id: contestant_id}).pluck(:name).join(", ")
  end

  def self.project_contestant_count(project_id)
    ContestantProject.where(project_id: "#{project_id}").size
  end
end
