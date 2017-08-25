class StaffMembersController < ApplicationController
  def index
    @staff_members = StaffMember.all

    render("staff_members/index.html.erb")
  end

  def show
    @staff_member = StaffMember.find(params[:id])

    render("staff_members/show.html.erb")
  end

  def new
    @staff_member = StaffMember.new

    render("staff_members/new.html.erb")
  end

  def create
    @staff_member = StaffMember.new

    @staff_member.name = params[:name]
    @staff_member.email = params[:email]
    @staff_member.telephone = params[:telephone]
    @staff_member.photo = params[:photo]
    @staff_member.em_contact_name = params[:em_contact_name]
    @staff_member.em_contact_email = params[:em_contact_email]
    @staff_member.em_contact_telephone = params[:em_contact_telephone]
    @staff_member.organization_id = params[:organization_id]
    @staff_member.office_id = params[:office_id]

    save_status = @staff_member.save

    if save_status == true
      redirect_to("/staff_members/#{@staff_member.id}", :notice => "Staff member created successfully.")
    else
      render("staff_members/new.html.erb")
    end
  end

  def edit
    @staff_member = StaffMember.find(params[:id])

    render("staff_members/edit.html.erb")
  end

  def update
    @staff_member = StaffMember.find(params[:id])

    @staff_member.name = params[:name]
    @staff_member.email = params[:email]
    @staff_member.telephone = params[:telephone]
    @staff_member.photo = params[:photo]
    @staff_member.em_contact_name = params[:em_contact_name]
    @staff_member.em_contact_email = params[:em_contact_email]
    @staff_member.em_contact_telephone = params[:em_contact_telephone]
    @staff_member.organization_id = params[:organization_id]
    @staff_member.office_id = params[:office_id]

    save_status = @staff_member.save

    if save_status == true
      redirect_to("/staff_members/#{@staff_member.id}", :notice => "Staff member updated successfully.")
    else
      render("staff_members/edit.html.erb")
    end
  end

  def destroy
    @staff_member = StaffMember.find(params[:id])

    @staff_member.destroy

    if URI(request.referer).path == "/staff_members/#{@staff_member.id}"
      redirect_to("/", :notice => "Staff member deleted.")
    else
      redirect_to(:back, :notice => "Staff member deleted.")
    end
  end
end
