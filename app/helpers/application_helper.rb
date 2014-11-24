module ApplicationHelper
  def full_title(title=nil)
    if title
      I18n.translate("devex.title") + " | #{title}"
    else
      I18n.translate("devex.title")
    end
  end

  def metadata_for(video_path, *options)
    video = FFMPEG::Movie.new(video_path)
    duration = Time.at(video.duration).utc.strftime("%H:%M:%S")
    size = number_to_human_size(video.size)
    metadata = []

    if options.empty?
      metadata << "duration: #{duration}"
      metadata << "size: #{size}"
      metadata.join(" | ")
    else
      options.each do |option|
        if option.to_s == "size"
          metadata << "size: #{size}"
        elsif option.to_s == "duration"
          metadata << "duration: #{duration}"
        else
          metadata << "#{option.to_s}: #{video.send(option.to_sym)}"
        end
      end
      metadata.join(" | ")
    end
  end
end
