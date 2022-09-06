class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @contestant_count = ContestantProject.project_contestant_count(params[:id])
  end
end
