# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  has_and_belongs_to_many :languages

  def self.nice_json
    languages = {}
    self.all.each do |country|
      languages[ country.name ] = country.languages
    end
    languages.to_json
  end
end
