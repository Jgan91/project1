class CreateWritingSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :writing_systems do |t|
      t.text :name
      t.text :time_period
      t.text :sample
      t.text :child_systems

      t.timestamps
    end
  end
end
