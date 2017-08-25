# == Schema Information
#
# Table name: offices
#
#  id            :integer          not null, primary key
#  name          :string
#  city          :string
#  state         :string
#  address       :text
#  lease_expiry  :date
#  size          :float
#  annual_cost   :float
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  occ_rate      :float
#

class Office < ApplicationRecord
    has_many :occupancies, :dependent => :destroy
    has_many :emergency_wardens, :dependent => :destroy
    has_many :emergency_events
    has_many :staff_members, :dependent => :nullify
    belongs_to :department
end
