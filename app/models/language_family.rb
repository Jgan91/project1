# == Schema Information
#
# Table name: language_families
#
#  id                      :integer          not null, primary key
#  name                    :text
#  geographic_distribution :string
#  proto_language_id       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class LanguageFamily < ApplicationRecord
  has_many :languages

  has_many :child_languages, class_name: "LanguageFamily",
                             foreign_key: "proto_language_id"

  belongs_to :proto_language, class_name: "LanguageFamily", :optional => true
end
