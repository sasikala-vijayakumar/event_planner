class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
    @parties = Party.order(:date_time).page(params[:page]).per(5)
  end

  def show
    @attendee = @party.attendees.build  # For "Add Attendee" form
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to @party, notice: "Party created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @party.update(party_params)
      redirect_to @party, notice: "Party updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @party.destroy
    redirect_to parties_path, notice: "Party deleted successfully!"
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:title, :date_time, :description)
  end
end
