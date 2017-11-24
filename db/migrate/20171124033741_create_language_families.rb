class CreateLanguageFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :language_families do |t|
      t.text :name
      t.string :geographic_distribution
      t.text :proto_language

      t.timestamps
    end
  end
end
