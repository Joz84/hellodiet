class AddPriceToFormulas < ActiveRecord::Migration[5.0]
  def change
    add_monetize :formulas, :price, currency: { present: false }
  end
end
