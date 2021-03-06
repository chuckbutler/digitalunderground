class DjsController < ApplicationController
  before_filter :get_site_config
  before_action :set_dj, only: [:show, :edit, :update, :destroy]
  layout "interior"
  respond_to :html

  def index
    @djs = Dj.all
    respond_with(@djs)
  end

  def show
    respond_with(@dj)
  end

  def new
    @dj = Dj.new
    respond_with(@dj)
  end

  def edit
  end

  def create
    @dj = Dj.new(dj_params)
    @dj.save
    respond_with(@dj)
  end

  def update
    @dj.update(dj_params)
    respond_with(@dj)
  end

  def destroy
    @dj.destroy
    respond_with(@dj)
  end

  private
    def set_dj
      @dj = Dj.find(params[:id])
    end

    def dj_params
      params.require(:dj).permit(:name, :experience, :location, :genre, :collab, :software, :photo, :soundcloud, :mixcloud, :youtube, :vimeo, :bio)
    end
end
