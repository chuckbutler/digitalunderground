module HomeHelper
  def video_image(video)
    v = VideoInfo.new(video.link)
    return v.thumbnail_medium
  end
  def video_title(video)
    v = VideoInfo.new(video.link)
    return v.title
  end

end
