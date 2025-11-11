class AttendeesController < ApplicationController
  before_action :set_party

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

  private

  def set_party
    @party = Party.find(params[:party_id])
  end

  def attendee_params
    params.require(:attendee).permit(:full_name, :email, :phone)
  end
end
