class CreateCountriesLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :countries_languages, :id => false do |t|
      t.integer :country_id
      t.integer :language_id
    end
  end
end
