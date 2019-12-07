class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.all

    render("collaborator_templates/index.html.erb")
  end

  def show
    @collaborator = Collaborator.find(params.fetch("id_to_display"))

    render("collaborator_templates/show.html.erb")
  end

  def new_form
    @collaborator = Collaborator.new

    render("collaborator_templates/new_form.html.erb")
  end

  def create_row
    @collaborator = Collaborator.new

    @collaborator.user_id = params.fetch("user_id")
    @collaborator.project_id = params.fetch("project_id")

    if @collaborator.valid?
      @collaborator.save

      redirect_back(:fallback_location => "/collaborators", :notice => "Collaborator created successfully.")
    else
      render("collaborator_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @collaborator = Collaborator.find(params.fetch("prefill_with_id"))

    render("collaborator_templates/edit_form.html.erb")
  end

  def update_row
    @collaborator = Collaborator.find(params.fetch("id_to_modify"))

    @collaborator.user_id = params.fetch("user_id")
    @collaborator.project_id = params.fetch("project_id")

    if @collaborator.valid?
      @collaborator.save

      redirect_to("/collaborators/#{@collaborator.id}", :notice => "Collaborator updated successfully.")
    else
      render("collaborator_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @collaborator = Collaborator.find(params.fetch("id_to_remove"))

    @collaborator.destroy

    redirect_to("/users/#{@collaborator.user_id}", notice: "Collaborator deleted successfully.")
  end

  def destroy_row_from_project
    @collaborator = Collaborator.find(params.fetch("id_to_remove"))

    @collaborator.destroy

    redirect_to("/projects/#{@collaborator.project_id}", notice: "Collaborator deleted successfully.")
  end

  def destroy_row
    @collaborator = Collaborator.find(params.fetch("id_to_remove"))

    @collaborator.destroy

    redirect_to("/collaborators", :notice => "Collaborator deleted successfully.")
  end
end
