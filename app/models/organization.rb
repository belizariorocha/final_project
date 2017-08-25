# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :text
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
    has_many :occupancies, :dependent => :destroy
    has_many :staff_members, :dependent => :nullify
    
    
end
