class NotesController < ApplicationController
  def index
    require_user
    @notes = current_user.notes
  end

  def show
    require_user

    @note = current_user.notes.find(params[:id])
  end

  def new
    require_user

    @note = current_user.notes.new
  end

  def create
    require_user

    @note = current_user.notes.new(note_params)
    @note.title = 'Untitled' if @note.title.blank?

    if @note.save
      flash[:success] = 'Your note has been saved.'

      redirect_to user_note_path(current_user, @note)
    else
      render :new
    end
  end

  def edit
    require_user

    @note = current_user.notes.find(params[:id])
  end

  def update
    require_user

    @note = current_user.notes.find(params[:id])
    @note.title = 'Untitled' if @note.title.blank?

    if @note.update_attributes(note_params)
      flash[:success] = 'Your changes have been saved.'

      redirect_to user_note_path(current_user, @note)
    else
      render :edit
    end
  end

  def delete
  end

private
  def note_params
    params.require(:note).permit(
      :title,
      :content
    )
  end
end
