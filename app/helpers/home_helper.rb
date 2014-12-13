module HomeHelper
  def video_image(video)
    v = VideoInfo.new(video.link)
    return v.thumbnail_medium
  end
  def video_title(video)
    v = VideoInfo.new(video.link)
    return v.title
  end
  def article_date(article)
    d = DateTime.new(article.created_at)
    return d.strftime("%B %d, %Y %I:%M %p")
  end

end
