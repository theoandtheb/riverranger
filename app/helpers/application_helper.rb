module ApplicationHelper

  def body_class
    return "#{controller.controller_name}-#{controller.action_name} #{controller.controller_name} #{controller.action_name} #{params[:permalink]}"
  end

end
