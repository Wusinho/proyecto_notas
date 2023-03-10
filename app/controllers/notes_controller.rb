# frozen_string_literal: true

class NotesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
  before_action :set_note, only: %i[show update edit]
  before_action :selected_params, only: [:index]
  def index
    @note = Note.new
    @notes = Note.filter(@selected_params, current_user)
  end

  def show; end

  def edit; end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      streams = []
      streams << turbo_stream.prepend('notes', partial: 'notes/note', locals: { note: @note })
      streams << turbo_stream.replace('note_form', partial: 'notes/form', locals: { note: Note.new })
      render turbo_stream: streams
    else
      render turbo_stream: turbo_stream.replace('error_message', partial: 'shared/error_message',
                                                                 locals: { message: @note.errors.full_messages.to_sentence })
    end
  end

  def update
    streams = []
    if @note.update(note_params)
      streams << turbo_stream.replace('edit_card', partial: 'full_note', locals: { note: @note })
      streams << turbo_stream.replace(dom_id(@note).to_s, partial: 'note', locals: { note: @note })
    else
      streams << turbo_stream.replace('error_message', partial: 'shared/error_message',
                                                       locals: { message: @note.errors.full_messages.to_sentence })
    end

    render turbo_stream: streams
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :title, :note_date)
  end
end
