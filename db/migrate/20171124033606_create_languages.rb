class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.text :name
      t.text :region
      t.integer :num_native_speaker

      t.timestamps
    end
  end
end
