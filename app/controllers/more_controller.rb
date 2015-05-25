class MoreController < ApplicationController
  skip_before_filter :require_login, only: [:index, :thanks]
  def index
  end
end
