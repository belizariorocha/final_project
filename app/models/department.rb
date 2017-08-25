# == Schema Information
#
# Table name: departments
#
#  id           :integer          not null, primary key
#  name         :string
#  code         :integer
#  executive_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  label        :string
#

class Department < ApplicationRecord
    has_many :offices, :dependent => :nullify
    belongs_to :executive, :class_name => "Job"
end
