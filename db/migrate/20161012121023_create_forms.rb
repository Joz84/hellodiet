class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.string :token_gform
      t.float :weight
      t.float :waist
      t.float :hips
      t.references :checkup, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
