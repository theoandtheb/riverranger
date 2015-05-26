module ObservationsHelper

  # Information links on the creation form
  def info_link(path) 
    link_to("?", path, class: 'ajax-popup info')
  end

end
