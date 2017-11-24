# == Schema Information
#
# Table name: writing_systems
#
#  id            :integer          not null, primary key
#  name          :text
#  time_period   :text
#  sample        :text
#  child_systems :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WritingSystem < ApplicationRecord
  has_and_belongs_to_many :languages
end
