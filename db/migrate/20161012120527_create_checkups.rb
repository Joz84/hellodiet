class CreateCheckups < ActiveRecord::Migration[5.0]
  def change
    create_table :checkups do |t|
      t.string :content
      t.string :kind
      t.date :paid_at
      t.datetime :start_time
      t.references :user, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
