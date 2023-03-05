class NotesController < ApplicationController
  before_action :set_note, only: [:show]
  def index
    if params[:sort]
      @notes = current_user.notes.order(params[:sort])
    else
      @notes = current_user.notes
    end
  end

  def show
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

end
