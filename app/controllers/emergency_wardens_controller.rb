class EmergencyWardensController < ApplicationController
  def index
    @emergency_wardens = EmergencyWarden.all

    render("emergency_wardens/index.html.erb")
  end

  def show
    @emergency_warden = EmergencyWarden.find(params[:id])

    render("emergency_wardens/show.html.erb")
  end

  def new
    @emergency_warden = EmergencyWarden.new

    render("emergency_wardens/new.html.erb")
  end

  def create
    @emergency_warden = EmergencyWarden.new

    @emergency_warden.role = params[:role]
    @emergency_warden.office_id = params[:office_id]
    @emergency_warden.staff_member_id = params[:staff_member_id]
    @emergency_warden.acknowledged = params[:acknowledged]

    save_status = @emergency_warden.save

    if save_status == true
      redirect_to("/emergency_wardens/#{@emergency_warden.id}", :notice => "Emergency warden created successfully.")
    else
      render("emergency_wardens/new.html.erb")
    end
  end

  def edit
    @emergency_warden = EmergencyWarden.find(params[:id])

    render("emergency_wardens/edit.html.erb")
  end

  def update
    @emergency_warden = EmergencyWarden.find(params[:id])

    @emergency_warden.role = params[:role]
    @emergency_warden.office_id = params[:office_id]
    @emergency_warden.staff_member_id = params[:staff_member_id]
    @emergency_warden.acknowledged = params[:acknowledged]

    save_status = @emergency_warden.save

    if save_status == true
      redirect_to("/emergency_wardens/#{@emergency_warden.id}", :notice => "Emergency warden updated successfully.")
    else
      render("emergency_wardens/edit.html.erb")
    end
  end

  def destroy
    @emergency_warden = EmergencyWarden.find(params[:id])

    @emergency_warden.destroy

    if URI(request.referer).path == "/emergency_wardens/#{@emergency_warden.id}"
      redirect_to("/", :notice => "Emergency warden deleted.")
    else
      redirect_to(:back, :notice => "Emergency warden deleted.")
    end
  end
end
