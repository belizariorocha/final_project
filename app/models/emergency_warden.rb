# == Schema Information
#
# Table name: emergency_wardens
#
#  id              :integer          not null, primary key
#  role            :string
#  office_id       :integer
#  staff_member_id :integer
#  acknowledged    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class EmergencyWarden < ApplicationRecord
    belongs_to :office
    belongs_to :staff_member, :required => false
end
