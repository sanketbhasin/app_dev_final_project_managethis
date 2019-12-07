class BugsController < ApplicationController
  def index
    @q = Bug.ransack(params[:q])
    @bugs = @q.result(:distinct => true).includes(:project).page(params[:page]).per(10)

    render("bug_templates/index.html.erb")
  end

  def show
    @bug = Bug.find(params.fetch("id_to_display"))

    render("bug_templates/show.html.erb")
  end

  def new_form
    @bug = Bug.new

    render("bug_templates/new_form.html.erb")
  end

  def create_row
    @bug = Bug.new

    @bug.project_id = params.fetch("project_id")
    @bug.title = params.fetch("title")
    @bug.description = params.fetch("description")
    @bug.deadline = params.fetch("deadline")
    @bug.image_of_bug = params.fetch("image_of_bug")
    @bug.status = params.fetch("status")

    if @bug.valid?
      @bug.save

      redirect_back(:fallback_location => "/bugs", :notice => "Bug created successfully.")
    else
      render("bug_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_project
    @bug = Bug.new

    @bug.project_id = params.fetch("project_id")
    @bug.title = params.fetch("title")
    @bug.description = params.fetch("description")
    @bug.deadline = params.fetch("deadline")
    @bug.image_of_bug = params.fetch("image_of_bug")
    @bug.status = params.fetch("status")

    if @bug.valid?
      @bug.save

      redirect_to("/projects/#{@bug.project_id}", notice: "Bug created successfully.")
    else
      render("bug_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bug = Bug.find(params.fetch("prefill_with_id"))

    render("bug_templates/edit_form.html.erb")
  end

  def update_row
    @bug = Bug.find(params.fetch("id_to_modify"))

    @bug.project_id = params.fetch("project_id")
    @bug.title = params.fetch("title")
    @bug.description = params.fetch("description")
    @bug.deadline = params.fetch("deadline")
    @bug.image_of_bug = params.fetch("image_of_bug")
    @bug.status = params.fetch("status")

    if @bug.valid?
      @bug.save

      redirect_to("/bugs/#{@bug.id}", :notice => "Bug updated successfully.")
    else
      render("bug_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_project
    @bug = Bug.find(params.fetch("id_to_remove"))

    @bug.destroy

    redirect_to("/projects/#{@bug.project_id}", notice: "Bug deleted successfully.")
  end

  def destroy_row
    @bug = Bug.find(params.fetch("id_to_remove"))

    @bug.destroy

    redirect_to("/bugs", :notice => "Bug deleted successfully.")
  end
end
