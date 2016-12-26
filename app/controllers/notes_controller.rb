class NotesController < ApplicationController
  before_action :require_user
  
  def index
    @notes = current_user.notes
  end

  def show
    @note = current_user.notes.find(params[:id])

    # pass note content to js controller for rendering
    js noteContent: @note.content
  end

  def new
    @note = current_user.notes.new
  end

  def create
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
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])
    @note.title = 'Untitled' if @note.title.blank?

    if @note.update_attributes(note_params)
      flash[:success] = 'Your changes have been saved.'

      redirect_to user_note_path(current_user, @note)
    else
      render :edit
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy
    flash[:success] = 'The note has been deleted.'
    redirect_to user_notes_path(current_user)
  end

private
  def note_params
    params.require(:note).permit(
      :title,
      :content,
      :public
    )
  end
end
