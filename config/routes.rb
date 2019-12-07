Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "projects#index"
  # Routes for the Collaborator resource:

  # CREATE
  get("/collaborators/new", { :controller => "collaborators", :action => "new_form" })
  post("/create_collaborator", { :controller => "collaborators", :action => "create_row" })
  post("/create_collaborator_from_project", { :controller => "collaborators", :action => "create_row_from_project" })

  # READ
  get("/collaborators", { :controller => "collaborators", :action => "index" })
  get("/collaborators/:id_to_display", { :controller => "collaborators", :action => "show" })

  # UPDATE
  get("/collaborators/:prefill_with_id/edit", { :controller => "collaborators", :action => "edit_form" })
  post("/update_collaborator/:id_to_modify", { :controller => "collaborators", :action => "update_row" })

  # DELETE
  get("/delete_collaborator/:id_to_remove", { :controller => "collaborators", :action => "destroy_row" })
  get("/delete_collaborator_from_project/:id_to_remove", { :controller => "collaborators", :action => "destroy_row_from_project" })
  get("/delete_collaborator_from_user/:id_to_remove", { :controller => "collaborators", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Bug resource:

  # CREATE
  get("/bugs/new", { :controller => "bugs", :action => "new_form" })
  post("/create_bug", { :controller => "bugs", :action => "create_row" })
  post("/create_bug_from_project", { :controller => "bugs", :action => "create_row_from_project" })

  # READ
  get("/bugs", { :controller => "bugs", :action => "index" })
  get("/bugs/:id_to_display", { :controller => "bugs", :action => "show" })

  # UPDATE
  get("/bugs/:prefill_with_id/edit", { :controller => "bugs", :action => "edit_form" })
  post("/update_bug/:id_to_modify", { :controller => "bugs", :action => "update_row" })

  # DELETE
  get("/delete_bug/:id_to_remove", { :controller => "bugs", :action => "destroy_row" })
  get("/delete_bug_from_project/:id_to_remove", { :controller => "bugs", :action => "destroy_row_from_project" })

  #------------------------------

  # Routes for the Project resource:

  # CREATE
  get("/projects/new", { :controller => "projects", :action => "new_form" })
  post("/create_project", { :controller => "projects", :action => "create_row" })

  # READ
  get("/projects", { :controller => "projects", :action => "index" })
  get("/projects/:id_to_display", { :controller => "projects", :action => "show" })

  # UPDATE
  get("/projects/:prefill_with_id/edit", { :controller => "projects", :action => "edit_form" })
  post("/update_project/:id_to_modify", { :controller => "projects", :action => "update_row" })

  # DELETE
  get("/delete_project/:id_to_remove", { :controller => "projects", :action => "destroy_row" })
  get("/delete_project_from_user/:id_to_remove", { :controller => "projects", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
