# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  name            :string
#  details         :text
#  fte_utilization :float
#  staff_member_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Job < ApplicationRecord
    #An Executive has many departments under management
    has_many :departments, :foreign_key => "executive_id", :dependent => :nullify
    
    belongs_to :staff_member, :required => false
end
