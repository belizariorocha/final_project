class EmergencyTypesController < ApplicationController
  def index
    @emergency_types = EmergencyType.all

    render("emergency_types/index.html.erb")
  end

  def show
    @emergency_type = EmergencyType.find(params[:id])

    render("emergency_types/show.html.erb")
  end

  def new
    @emergency_type = EmergencyType.new

    render("emergency_types/new.html.erb")
  end

  def create
    @emergency_type = EmergencyType.new

    @emergency_type.name = params[:name]
    @emergency_type.details = params[:details]

    save_status = @emergency_type.save

    if save_status == true
      redirect_to("/emergency_types/#{@emergency_type.id}", :notice => "Emergency type created successfully.")
    else
      render("emergency_types/new.html.erb")
    end
  end

  def edit
    @emergency_type = EmergencyType.find(params[:id])

    render("emergency_types/edit.html.erb")
  end

  def update
    @emergency_type = EmergencyType.find(params[:id])

    @emergency_type.name = params[:name]
    @emergency_type.details = params[:details]

    save_status = @emergency_type.save

    if save_status == true
      redirect_to("/emergency_types/#{@emergency_type.id}", :notice => "Emergency type updated successfully.")
    else
      render("emergency_types/edit.html.erb")
    end
  end

  def destroy
    @emergency_type = EmergencyType.find(params[:id])

    @emergency_type.destroy

    if URI(request.referer).path == "/emergency_types/#{@emergency_type.id}"
      redirect_to("/", :notice => "Emergency type deleted.")
    else
      redirect_to(:back, :notice => "Emergency type deleted.")
    end
  end
end
