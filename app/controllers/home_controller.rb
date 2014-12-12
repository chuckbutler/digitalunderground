class HomeController < ApplicationController
  def index
    @video = Video.where({active: true}).limit(5)
  end
end
