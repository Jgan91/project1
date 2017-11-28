class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.text :name
      t.text :region
      t.integer :num_native_speaker
      t.integer :language_family_id
      t.text :sample

      t.timestamps
    end
  end
end
