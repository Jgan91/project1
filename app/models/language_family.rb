# == Schema Information
#
# Table name: language_families
#
#  id                      :integer          not null, primary key
#  name                    :text
#  geographic_distribution :string
#  proto_language          :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class LanguageFamily < ApplicationRecord
  has_many :languages
end
