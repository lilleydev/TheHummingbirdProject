class ProjectsController < ApplicationController
  before_action :redirect_if_logged_out

  def new
    @project = Project.new
  end

  def create
    binding.pry
    @project = Project.new(project_params)
    if @project.save

    end
  end
end
