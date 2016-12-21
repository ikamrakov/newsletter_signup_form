class LeadsController < ApplicationController
  def create
    @lead = Lead.new lead_params
    if @lead.save
      cookies[:saved_lead] = true
      format.html { redirect_to root_path}
      format.js
    else
      format.html { redirect_to root_path, alert: 'Failed to save' }
    end
  end

  private
  def lead_params
    params.require(:lead).permit(:name, :email, :device, :country)
  end
end
