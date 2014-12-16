class CreateDjController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!
  layout "interior"

  steps :basic, :interactive, :social

  def show

    @user = User.find(current_user)
    if @user.dj and @user.dj.active?
      redirect_to controller: "djs", action: "show", id: current_user.dj.id
      return
    end

    if current_user.dj.blank?
      dj = Dj.new(user: current_user.id)
      dj.save()
      current_user.dj = dj
    end
    @dj = current_user.dj
    render_wizard
  end

  def update
    @dj = Dj.find(params[:dj][:id])
    params[:dj][:status] = step.to_s
    params[:dj][:status] = 'active' if step == steps.last
    @dj.update_attributes(dj_params)
    render_wizard @dj
  end

  def dj_params
    params.require(:dj).permit(:name, :avatar_name, :secondlife, :experience, :location, :bio, :photo, :for_hire, :collab, :software, :facebook, :twitter, :soundcloud, :mixcloud, :youtube, :vimeo, :status)
  end

end
