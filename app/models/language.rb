# == Schema Information
#
# Table name: languages
#
#  id                 :integer          not null, primary key
#  name               :text
#  region             :text
#  num_native_speaker :integer
#  language_family_id :integer
#  sample             :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Language < ApplicationRecord
  belongs_to :language_family, :optional => true
  has_and_belongs_to_many :writing_systems
  has_and_belongs_to_many :countries
end
