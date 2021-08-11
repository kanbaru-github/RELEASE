class Public::RelationshipsController < ApplicationController

  before_action :authenticate_customer!

	def create
		current_customer.mute(params[:customer_id])
		redirect_to request.referer
	end

	def destroy
		current_customer.unmute(params[:customer_id])
		redirect_to request.referer
	end

  def mutings
		customer = Customer.find(params[:customer_id])
		@customers = customer.mutings
  end

  def muters
		customer = Customer.find(params[:customer_id])
		@customers = customer.muters
  end

end
