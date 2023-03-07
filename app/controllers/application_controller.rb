class ApplicationController < ActionController::Base
  def selected_params
    @selected_params = params.slice(:sort_by_name, :search)
  end
end
