class AttendeesController < ApplicationController
  before_action :set_party

  def create
    @attendee = @party.attendees.build(attendee_params)
    if @attendee.save
      redirect_to @party, notice: "Attendee added successfully!"
    else
      redirect_to @party, alert: "Failed to add attendee."
    end
  end

  def destroy
    @attendee = @party.attendees.find(params[:id])
    @attendee.destroy
    redirect_to @party, notice: "Attendee removed successfully!"
  end

  private

  def set_party
    @party = Party.find(params[:party_id])
  end

  def attendee_params
    params.require(:attendee).permit(:full_name, :email, :phone)
  end
end
