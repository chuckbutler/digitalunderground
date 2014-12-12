module HomeHelper
  def video_image(video)
    v = VideoInfo.new(video.embed)
    return v.thumbnail_medium
  end
  def video_title(video)
    v = VideoInfo.new(video.embed)
    return v.title
  end

end
