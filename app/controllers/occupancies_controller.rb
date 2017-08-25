class OccupanciesController < ApplicationController
  def index
    @occupancies = Occupancy.all.order("office_id")

    render("occupancies/index.html.erb")
  end

  def show
    @occupancy = Occupancy.find(params[:id])

    render("occupancies/show.html.erb")
  end

  def new
    @occupancy = Occupancy.new

    render("occupancies/new.html.erb")
  end

  def create
    @occupancy = Occupancy.new

    @occupancy.organization_id = params[:organization_id]
    @occupancy.office_id = params[:office_id]
    @occupancy.staff_count = params[:staff_count]

    save_status = @occupancy.save

    if save_status == true
      redirect_to("/occupancies/#{@occupancy.id}", :notice => "Occupancy created successfully.")
    else
      render("occupancies/new.html.erb")
    end
  end

  def edit
    @occupancy = Occupancy.find(params[:id])

    render("occupancies/edit.html.erb")
  end

  def update
    @occupancy = Occupancy.find(params[:id])

    @occupancy.organization_id = params[:organization_id]
    @occupancy.office_id = params[:office_id]
    @occupancy.staff_count = params[:staff_count]

    save_status = @occupancy.save

    if save_status == true
      redirect_to("/occupancies/#{@occupancy.id}", :notice => "Occupancy updated successfully.")
    else
      render("occupancies/edit.html.erb")
    end
  end

  def destroy
    @occupancy = Occupancy.find(params[:id])

    @occupancy.destroy

    redirect_to("/occupancies", :notice => "Occupancy deleted.")
  end
end
