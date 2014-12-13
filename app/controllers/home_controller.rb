class HomeController < ApplicationController
  def index
    @video = Video.where({active: true}).limit(5)
    @news = News.order_by(:created_at.desc)
  end
end
