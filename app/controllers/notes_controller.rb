class NotesController < ApplicationController
  before_action :set_note, only: [:show, :note_card, :edit, :update]
  def index
    @note = Note.new
    if params[:sort]
      @notes = current_user.notes.order(params[:sort])
    else
      @notes = current_user.notes
    end
  end

  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      @note.save
      format.turbo_stream
    end

  end

  def update
    respond_to do |format|
      @note.update(note_params)
      format.turbo_stream
    end
  end

  def show
  end

  def note_card
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :title, :note_date)
  end
end
