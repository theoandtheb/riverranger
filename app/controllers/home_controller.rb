class HomeController < ApplicationController
  layout "home"
  skip_before_filter :require_login, only: [:index]
  def index
    
  end
  def about

  end
end
