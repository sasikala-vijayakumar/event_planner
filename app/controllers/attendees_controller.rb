class AttendeesController < ApplicationController
  before_action :set_party
  before_action :set_attendee, only: [:destroy]

  def create
    @attendee = @party.attendees.new(attendee_params)

    if @attendee.save
      redirect_to @party, notice: "Attendee added successfully!"
    else
      # Collect error messages
      flash.now[:alert] = @attendee.errors.full_messages.join(", ")
      render "parties/show", status: :unprocessable_entity
    end
  end

  def destroy
    if @attendee.destroy
      redirect_to @party, notice: "Attendee removed."
    else
      redirect_to @party, alert: "Failed to remove attendee."
    end
  end

  private

  def set_party
    @party = Party.find(params[:party_id])
  end

  def set_attendee
    @attendee = @party.attendees.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:full_name, :email, :phone)
  end
end
