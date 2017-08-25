class OfficesController < ApplicationController
  def index
    @target_occ_rate = params[:occ_rate].to_i
    @time_horizon = params[:time_horizon].to_i
    if @time_horizon == 0
      @time_horizon = 3
    end
    @executive = params[:executive]
    if @executive.nil?
      @executive = "All"
    end
    @inc_partners = params[:inc_partners]
    if @inc_partners.nil?
      @inc_partners = "Yes"
    end
   
    if @executive == "All"
      @offices = Office.all
      @occupancy = Occupancy.all
    else
      staff = StaffMember.find_by(:name => @executive).id
      exec = Job.find_by(:staff_member_id => staff).id
      departments = Department.where(:executive_id => exec)
      @offices = Office.where(:department_id => (departments.ids))
      @occupancy = Occupancy.where(:office_id => (@offices.ids))
    end
    
    if @inc_partners == "Yes"
    elsif @inc_partners == "No"
      i = Organization.find_by({ :name => "Teach For America" }).id
      @occupancy = @occupancy.where(:organization_id => i)
    end

    @potential = 0
  
    @total_size = (@offices.sum(:size)).to_f
    @total_staff_count = @occupancy.sum(:staff_count).to_f
    @occ_rate = @total_size / @total_staff_count
    if @target_occ_rate == 0
      @target_occ_rate = 180
    end

    
    first_date = Date.today - 20*365
    @cutoff_date = Date.today + @time_horizon*365
    @offices_to_resize = @offices.where(:lease_expiry => (first_date..@cutoff_date))
    @occupancy_to_resize = @occupancy.where(:office_id => (@offices_to_resize.ids))
    @leases = @offices_to_resize.count
    @offices_to_resize = @offices_to_resize.where("occ_rate > #{@target_occ_rate}")
    @occupancy_to_resize = @occupancy_to_resize.where(:office_id => (@offices_to_resize.ids))
    

    @total_size_to_resize = (@offices_to_resize.sum(:size)).to_f
    @total_staff_count_to_resize = @occupancy_to_resize.sum(:staff_count).to_f
    
    @final_total_size = @total_size - @total_size_to_resize + @total_staff_count_to_resize * @target_occ_rate
    @final_total_staff_count = @total_staff_count
    @final_occ_rate = @final_total_size / @final_total_staff_count
    @potential = 1 - (@final_total_size).to_f / (@total_size).to_f
    
    
    @offices_table = @offices.order('size DESC')
    
    # The following line is a weak code. Ideally we would define a subset of jobs for executives managing regions
    @exec_options = ["All", "Omari Todd", "Kira Orange Jones", "Michelle Culver", "Vacant"]

    render("offices/index.html.erb")
  end

  def show
    @office = Office.find(params[:id])

    render("offices/show.html.erb")
  end

  def new
    @office = Office.new

    render("offices/new.html.erb")
  end

  def create
    @office = Office.new

    @office.name = params[:name]
    @office.city = params[:city]
    @office.state = params[:state]
    @office.address = params[:address]
    @office.lease_expiry = params[:lease_expiry]
    @office.size = params[:size]
    @office.annual_cost = params[:annual_cost]
    @office.department_id = params[:department_id]

    save_status = @office.save

    if save_status == true
      redirect_to("/offices/#{@office.id}", :notice => "Office created successfully.")
    else
      render("offices/new.html.erb")
    end
  end

  def edit
    @office = Office.find(params[:id])

    render("offices/edit.html.erb")
  end

  def update
    @office = Office.find(params[:id])

    @office.name = params[:name]
    @office.city = params[:city]
    @office.state = params[:state]
    @office.address = params[:address]
    @office.lease_expiry = params[:lease_expiry]
    @office.size = params[:size]
    @office.annual_cost = params[:annual_cost]
    @office.department_id = params[:department_id]

    save_status = @office.save

    if save_status == true
      redirect_to("/offices/#{@office.id}", :notice => "Office updated successfully.")
    else
      render("offices/edit.html.erb")
    end
  end

  def destroy
    @office = Office.find(params[:id])

    @office.destroy

    redirect_to("/offices", :notice => "Office deleted.")
  end
end
