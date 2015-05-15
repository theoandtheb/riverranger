class HomeController < ApplicationController
	skip_before_filter :require_login, only: [:index]
  def index
  	render '/home/index.html'
  end

end