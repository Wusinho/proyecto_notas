module NotesHelper
  def can_edit_note?(note)
    user_signed_in? && note.author == current_user
  end
end
