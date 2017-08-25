class EmergencyEventsController < ApplicationController
  def index
    @emergency_events = EmergencyEvent.all

    render("emergency_events/index.html.erb")
  end

  def show
    @emergency_event = EmergencyEvent.find(params[:id])

    render("emergency_events/show.html.erb")
  end

  def new
    @emergency_event = EmergencyEvent.new

    render("emergency_events/new.html.erb")
  end

  def create
    @emergency_event = EmergencyEvent.new

    @emergency_event.date = params[:date]
    @emergency_event.emergency_type_id = params[:emergency_type_id]
    @emergency_event.details = params[:details]
    @emergency_event.office_id = params[:office_id]

    save_status = @emergency_event.save

    if save_status == true
      redirect_to("/emergency_events/#{@emergency_event.id}", :notice => "Emergency event created successfully.")
    else
      render("emergency_events/new.html.erb")
    end
  end

  def edit
    @emergency_event = EmergencyEvent.find(params[:id])

    render("emergency_events/edit.html.erb")
  end

  def update
    @emergency_event = EmergencyEvent.find(params[:id])

    @emergency_event.date = params[:date]
    @emergency_event.emergency_type_id = params[:emergency_type_id]
    @emergency_event.details = params[:details]
    @emergency_event.office_id = params[:office_id]

    save_status = @emergency_event.save

    if save_status == true
      redirect_to("/emergency_events/#{@emergency_event.id}", :notice => "Emergency event updated successfully.")
    else
      render("emergency_events/edit.html.erb")
    end
  end

  def destroy
    @emergency_event = EmergencyEvent.find(params[:id])

    @emergency_event.destroy

    if URI(request.referer).path == "/emergency_events/#{@emergency_event.id}"
      redirect_to("/", :notice => "Emergency event deleted.")
    else
      redirect_to(:back, :notice => "Emergency event deleted.")
    end
  end
end
