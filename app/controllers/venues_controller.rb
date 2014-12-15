class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  layout "interior"
  respond_to :html

  def index
    @featured = Venue.where({feature: true}).order_by(:created_at.desc)
    @latest = Venue.all
    respond_with(@venues)
  end

  def show
    respond_with(@venue)
  end

  def new
    @venue = Venue.new
    respond_with(@venue)
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    respond_with(@venue)
  end

  def update
    @venue.update(venue_params)
    respond_with(@venue)
  end

  def destroy
    @venue.destroy
    respond_with(@venue)
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :slurl, :description, :genres, :radio, :partner_program, :photo, :facebook, :staff, :user)
    end
end
