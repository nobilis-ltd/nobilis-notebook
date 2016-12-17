class NotesController < ApplicationController
  def index
    require_user
  end

  def new
    require_user
    
    @note = @current_user.notes.new
  end

  def create
    require_user

    @note = @current_user.notes.new(note_params)
    @note.title = 'Untitled' if @note.title == ''

    if @note.save
      flash[:success] = 'Note successfully created.'

      redirect_to user_note_path(@current_user, @note)
    else
      render :new
    end
  end

  def edit
    require_user

    @note = @current_user.notes.find(params[:id])
  end

  def update
    require_user

    @note = @current_user.notes.find(params[:id])
    @note.title = 'Untitled' if @note.title == ''

    if @note.update_attributes(note_params)
      flash[:success] = 'Note successfully updated.'

      redirect_to user_note_path(@current_user, @note)
    else
      render :edit
    end
  end

private
  def note_params
    params.require(:note).permit(
      :title,
      :content
    )
  end
end
