module ApplicationHelper

  include Twitter::Autolink
 
  def twitter_text(text)
    text = auto_link(text)
    text ? text.html_safe : ''
  end

  def body_class
    return "#{controller.controller_name}-#{controller.action_name} #{controller.controller_name} #{controller.action_name} #{params[:permalink]}"
  end
end
