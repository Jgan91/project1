class CreateLanguagesWritingSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :languages_writing_systems do |t|
      t.integer :language_id
      t.integer :writing_system_id
    end
  end
end
