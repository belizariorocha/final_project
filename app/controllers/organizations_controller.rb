class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all

    render("organizations/index.html.erb")
  end

  def show
    @organization = Organization.find(params[:id])

    render("organizations/show.html.erb")
  end

  def new
    @organization = Organization.new

    render("organizations/new.html.erb")
  end

  def create
    @organization = Organization.new

    @organization.name = params[:name]
    @organization.details = params[:details]

    save_status = @organization.save

    if save_status == true
      redirect_to("/organizations/#{@organization.id}", :notice => "Organization created successfully.")
    else
      render("organizations/new.html.erb")
    end
  end

  def edit
    @organization = Organization.find(params[:id])

    render("organizations/edit.html.erb")
  end

  def update
    @organization = Organization.find(params[:id])

    @organization.name = params[:name]
    @organization.details = params[:details]

    save_status = @organization.save

    if save_status == true
      redirect_to("/organizations/#{@organization.id}", :notice => "Organization updated successfully.")
    else
      render("organizations/edit.html.erb")
    end
  end

  def destroy
    @organization = Organization.find(params[:id])

    @organization.destroy

    redirect_to("/organizations", :notice => "Organization deleted.")
    
  end
end
