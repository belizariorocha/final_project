# == Schema Information
#
# Table name: staff_members
#
#  id                   :integer          not null, primary key
#  name                 :text
#  email                :text
#  telephone            :string
#  photo                :string
#  em_contact_name      :text
#  em_contact_email     :text
#  em_contact_telephone :string
#  organization_id      :integer
#  office_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class StaffMember < ApplicationRecord
    belongs_to :office
    belongs_to :organization
    has_many :jobs, :dependent => :nullify
    has_one :emergency_warden, :dependent => :nullify
end
