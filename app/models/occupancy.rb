# == Schema Information
#
# Table name: occupancies
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  office_id       :integer
#  staff_count     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Occupancy < ApplicationRecord
    belongs_to :office
    belongs_to :organization
    
end
