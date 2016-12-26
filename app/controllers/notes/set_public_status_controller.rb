class Notes::SetPublicStatusController < ApplicationController
  before_filter :get_note

  # Make a note public
  def publicise
    @note.public = true
    @note.save
    flash[:success] = "This note is now public"
    redirect_to user_note_path(current_user, @note)
  end

  # Make a note private
  def privatise
    @note.public = false
    @note.save
    flash[:success] = "This note is now private"
    redirect_to user_note_path(current_user, @note)
  end

  private
    def get_note
      @note = current_user.notes.find(params[:id])
    end
end
