class CreateCheckups < ActiveRecord::Migration[5.0]
  def change
    create_table :checkups do |t|
      t.string :content
      t.boolean :online
      t.datetime :date
      t.references :user, foreign_key: true
      t.float :weight
      t.float :waist
      t.float :hips
      t.string :state
      t.monetize :price, currency: { present: false }
      t.json :payment

      t.timestamps
    end
  end
end
