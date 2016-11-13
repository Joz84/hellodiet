class CreateFormulas < ActiveRecord::Migration[5.0]
  def change
    create_table :formulas do |t|
      t.string :name
      t.string :comment
      t.string :photo_url
      t.integer :number_of_sessions

      t.timestamps
    end
  end
end
