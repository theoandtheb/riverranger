module ObservationsHelper

  # Information links on the creation form
  def info_link(path) 
    link_to("?", path, class: 'ajax-popup info')
  end

  # def tests_holder(test, title, class_name)
  #   content_tag(:li, class: class_name) do
  #     link_to("#") do
  #       content_tag(:h3, "Test") +
  #       content_tag(:div, class: "current") do
  #         content_tag(:h1, test[:values].last) +
  #         content_tag(:cite, test[:date].strftime("%B %d,%Y"))
  #       end
  #     end
  #   end
  # end

end
