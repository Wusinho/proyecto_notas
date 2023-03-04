class NotesController < ApplicationController
  def index
    @notes = current_user.notes
  end

  def title_order
    @notes = current_user.notes_title_ordered
  end

  def note_date_order
    @notes = current_user.notes_date_ordered
  end

end
