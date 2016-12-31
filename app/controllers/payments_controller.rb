class PaymentsController < ApplicationController
  before_action :set_checkup

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @checkup.price_cents, # or amount_pennies
      description:  "Payement pour la séance #{@checkup.id}",
      currency:     @checkup.price.currency
    )

    @checkup.update(payment: charge.to_json, state: 'paid')
    redirect_to checkup_path(@checkup)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_checkup_payment_path(@checkup)
  end

private

  def set_checkup
    @checkup = Checkup.where(state: 'pending').find(params[:checkup_id])
  end

end
