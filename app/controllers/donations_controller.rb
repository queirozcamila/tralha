class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      redirect_to receivers_path
      # Depois será necessário filtrar os receivers por receiver_profile compatível
    else
      render 'donations/new'
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :description, :user, :category, :status)
  end
end
