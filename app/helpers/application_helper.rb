module ApplicationHelper
  def full_title(title=nil)
    if title
      I18n.translate("devex.title") + " | #{title}"
    else
      I18n.translate("devex.title")
    end
  end
end
