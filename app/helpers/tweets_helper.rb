module TweetsHelper
  def find_youtube_url(youtube_url)
    if youtube_url.present? && youtube_url[0..16] == "https://youtu.be/"
      return youtube_url[17..27]
      # "https://youtu.be/WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
    else
      return nil
    end
  end
end

