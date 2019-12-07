class ProjectsController < ApplicationController
  before_action :current_user_must_be_project_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_project_user
    project = Project.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == project.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @projects = Project.all

    render("project_templates/index.html.erb")
  end

  def show
    @collaborator = Collaborator.new
    @bug = Bug.new
    @project = Project.find(params.fetch("id_to_display"))

    render("project_templates/show.html.erb")
  end

  def new_form
    @project = Project.new

    render("project_templates/new_form.html.erb")
  end

  def create_row
    @project = Project.new

    @project.user_id = params.fetch("user_id")

    if @project.valid?
      @project.save

      redirect_back(:fallback_location => "/projects", :notice => "Project created successfully.")
    else
      render("project_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @project = Project.find(params.fetch("prefill_with_id"))

    render("project_templates/edit_form.html.erb")
  end

  def update_row
    @project = Project.find(params.fetch("id_to_modify"))

    

    if @project.valid?
      @project.save

      redirect_to("/projects/#{@project.id}", :notice => "Project updated successfully.")
    else
      render("project_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @project = Project.find(params.fetch("id_to_remove"))

    @project.destroy

    redirect_to("/users/#{@project.user_id}", notice: "Project deleted successfully.")
  end

  def destroy_row
    @project = Project.find(params.fetch("id_to_remove"))

    @project.destroy

    redirect_to("/projects", :notice => "Project deleted successfully.")
  end
end
