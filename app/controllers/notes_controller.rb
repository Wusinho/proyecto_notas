class NotesController < ApplicationController
  def index
    if params[:sort]
      @notes = current_user.notes.order(params[:sort])
    else
      @notes = current_user.notes
    end
  end

end
