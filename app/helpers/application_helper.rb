module ApplicationHelper
  def full_title(title)
    I18n.translate("devex.title") + " | #{title}"
  end
end
