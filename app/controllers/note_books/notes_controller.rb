class NoteBooks::NotesController < ApplicationController
  before_action :require_user
    before_action :get_note_book


    def show
      @note = @note_book.notes.find(params[:id])

      # pass note content to js controller for rendering
      js noteContent: @note.content

    end

    def new
      @note = @note_book.notes.new

    end

    def edit
      @note = @note_book.notes.find(params[:id])
    end

    def create
      @note = @note_book.notes.new(note_params)
      @note.title = 'Untitled' if @note.title.blank?
      @note.user = current_user

      if @note.save
        flash[:success] = 'Your note has been saved.'

        redirect_to user_note_book_note_path(current_user, @note_book, @note)
      else
        render 'new'
      end
    end


    def update
      @note = @note_book.notes.find(params[:id])
      @note.title = 'Untitled' if @note.title.blank?

      if @note.update_attributes(note_params)
        flash[:success] = 'Your changes have been saved.'

        redirect_to user_note_book_note_path(current_user, @note_book, @note)
      else
        render 'edit'
      end
    end

    def destroy
      @note = @note_book.notes.find(params[:id])
      @note.destroy
      flash[:success] = 'The note has been deleted.'
      redirect_to user_note_book_path(current_user, @note_book)
    end

  private
    def note_params
      params.require(:note).permit(
        :title,
        :content
      )
    end

  def get_note_book
    @note_book = NoteBook.find(params[:note_book_id])
  end

end
