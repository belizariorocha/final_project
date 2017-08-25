Rails.application.routes.draw do
  devise_for :users
  
  get "/", :controller => "application", :action => "index"
  
  # # Routes for the Staff_member resource:
  # # CREATE
  # get "/staff_members/new", :controller => "staff_members", :action => "new"
  # post "/create_staff_member", :controller => "staff_members", :action => "create"

  # # READ
  # get "/staff_members", :controller => "staff_members", :action => "index"
  # get "/staff_members/:id", :controller => "staff_members", :action => "show"

  # # UPDATE
  # get "/staff_members/:id/edit", :controller => "staff_members", :action => "edit"
  # post "/update_staff_member/:id", :controller => "staff_members", :action => "update"

  # # DELETE
  # get "/delete_staff_member/:id", :controller => "staff_members", :action => "destroy"
  # #------------------------------
  
  # # Routes for the Emergency_type resource:
  # # CREATE
  # get "/emergency_types/new", :controller => "emergency_types", :action => "new"
  # post "/create_emergency_type", :controller => "emergency_types", :action => "create"

  # # READ
  # get "/emergency_types", :controller => "emergency_types", :action => "index"
  # get "/emergency_types/:id", :controller => "emergency_types", :action => "show"

  # # UPDATE
  # get "/emergency_types/:id/edit", :controller => "emergency_types", :action => "edit"
  # post "/update_emergency_type/:id", :controller => "emergency_types", :action => "update"

  # # DELETE
  # get "/delete_emergency_type/:id", :controller => "emergency_types", :action => "destroy"
  # #------------------------------

  # # Routes for the Emergency_event resource:
  # # CREATE
  # get "/emergency_events/new", :controller => "emergency_events", :action => "new"
  # post "/create_emergency_event", :controller => "emergency_events", :action => "create"

  # # READ
  # get "/emergency_events", :controller => "emergency_events", :action => "index"
  # get "/emergency_events/:id", :controller => "emergency_events", :action => "show"

  # # UPDATE
  # get "/emergency_events/:id/edit", :controller => "emergency_events", :action => "edit"
  # post "/update_emergency_event/:id", :controller => "emergency_events", :action => "update"

  # # DELETE
  # get "/delete_emergency_event/:id", :controller => "emergency_events", :action => "destroy"
  # #------------------------------

  # # Routes for the Emergency_warden resource:
  # # CREATE
  # get "/emergency_wardens/new", :controller => "emergency_wardens", :action => "new"
  # post "/create_emergency_warden", :controller => "emergency_wardens", :action => "create"

  # # READ
  # get "/emergency_wardens", :controller => "emergency_wardens", :action => "index"
  # get "/emergency_wardens/:id", :controller => "emergency_wardens", :action => "show"

  # # UPDATE
  # get "/emergency_wardens/:id/edit", :controller => "emergency_wardens", :action => "edit"
  # post "/update_emergency_warden/:id", :controller => "emergency_wardens", :action => "update"

  # # DELETE
  # get "/delete_emergency_warden/:id", :controller => "emergency_wardens", :action => "destroy"
  # #------------------------------

  # Routes for the Occupancy resource:
  # CREATE
  get "/occupancies/new", :controller => "occupancies", :action => "new"
  post "/create_occupancy", :controller => "occupancies", :action => "create"

  # READ
  get "/occupancies", :controller => "occupancies", :action => "index"
  get "/occupancies/:id", :controller => "occupancies", :action => "show"

  # UPDATE
  get "/occupancies/:id/edit", :controller => "occupancies", :action => "edit"
  post "/update_occupancy/:id", :controller => "occupancies", :action => "update"

  # DELETE
  get "/delete_occupancy/:id", :controller => "occupancies", :action => "destroy"
  #------------------------------

  # Routes for the Organization resource:
  # CREATE
  get "/organizations/new", :controller => "organizations", :action => "new"
  post "/create_organization", :controller => "organizations", :action => "create"

  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"

  # UPDATE
  get "/organizations/:id/edit", :controller => "organizations", :action => "edit"
  post "/update_organization/:id", :controller => "organizations", :action => "update"

  # DELETE
  get "/delete_organization/:id", :controller => "organizations", :action => "destroy"
  #------------------------------

  # # Routes for the Job resource:
  # # CREATE
  # get "/jobs/new", :controller => "jobs", :action => "new"
  # post "/create_job", :controller => "jobs", :action => "create"

  # # READ
  # get "/jobs", :controller => "jobs", :action => "index"
  # get "/jobs/:id", :controller => "jobs", :action => "show"

  # # UPDATE
  # get "/jobs/:id/edit", :controller => "jobs", :action => "edit"
  # post "/update_job/:id", :controller => "jobs", :action => "update"

  # # DELETE
  # get "/delete_job/:id", :controller => "jobs", :action => "destroy"
  # #------------------------------

  # # Routes for the Department resource:
  # # CREATE
  # get "/departments/new", :controller => "departments", :action => "new"
  # post "/create_department", :controller => "departments", :action => "create"

  # # READ
  # get "/departments", :controller => "departments", :action => "index"
  # get "/departments/:id", :controller => "departments", :action => "show"

  # # UPDATE
  # get "/departments/:id/edit", :controller => "departments", :action => "edit"
  # post "/update_department/:id", :controller => "departments", :action => "update"

  # # DELETE
  # get "/delete_department/:id", :controller => "departments", :action => "destroy"
  # #------------------------------

  # Routes for the Office resource:
  # CREATE
  get "/offices/new", :controller => "offices", :action => "new"
  post "/create_office", :controller => "offices", :action => "create"

  # READ
  get "/offices", :controller => "offices", :action => "index"
  get "/offices/:id", :controller => "offices", :action => "show"

  # UPDATE
  get "/offices/:id/edit", :controller => "offices", :action => "edit"
  post "/update_office/:id", :controller => "offices", :action => "update"

  # DELETE
  get "/delete_office/:id", :controller => "offices", :action => "destroy"
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
