# == Schema Information
#
# Table name: emergency_types
#
#  id         :integer          not null, primary key
#  name       :string
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmergencyType < ApplicationRecord
    has_many :emergency_events
end
