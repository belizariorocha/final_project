# == Schema Information
#
# Table name: emergency_events
#
#  id                :integer          not null, primary key
#  date              :date
#  emergency_type_id :integer
#  details           :text
#  office_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class EmergencyEvent < ApplicationRecord
    belongs_to :office
    belongs_to :emergency_type
end
