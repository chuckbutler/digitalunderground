class HomeController < ApplicationController
  def index
    @video = Video.where({active: true}).limit(5)
    @news = News.order_by(:created_at.desc)
    @featured = Venue.where({feature: true}).order_by(:created_at.desc)
    @latest = Venue.all.limit(10)
  end
end
