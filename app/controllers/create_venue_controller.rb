class CreateVenueController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!
  layout "interior"

  steps :basic, :sim

  def show

    @user = User.find(current_user)
    if @user.venue and @user.venue.active?
      redirect_to controller: "venues", action: "show", id: current_user.venue.id
      return
    end

    if current_user.venue.blank?
      venue = Venue.new(user: current_user.id)
      venue.save()
      current_user.venue = venue
    end
    @venue = current_user.venue
    render_wizard
  end

  def update
    @venue = Venue.find(params[:venue][:id])
    params[:venue][:status] = step.to_s
    params[:venue][:status] = 'active' if step == steps.last
    @venue.update_attributes(venue_params)
    render_wizard @venue
  end

  def venue_params
    params.require(:venue).permit(:name, :slurl, :description, :radio, :photo, :facebook, :tagline, :sim_rating, :hiring, :status)
  end

end
