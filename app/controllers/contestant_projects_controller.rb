class ContestantProjectsController < ApplicationController
  def index
    @contestants = Contestant.all
  end
end
