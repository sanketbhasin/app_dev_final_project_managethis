Rails.application.routes.draw do
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

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
