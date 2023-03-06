module NotesHelper
  def can_edit_note?(note)
    user_signed_in? && note.user == current_user
  end
end
