class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :edit]
  def index
    @note = Note.new
    if params[:sort]
      @notes = current_user.notes.order(params[:sort])
    elsif  params[:search]
      @notes = current_user.finder(params[:search])
    else
      @notes = current_user.notes
    end
  end

  def show
  end

  def edit
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



  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :title, :note_date)
  end
end
