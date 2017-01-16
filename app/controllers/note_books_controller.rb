class NoteBooksController < ApplicationController
  def index
    @note_books = NoteBook.all
  end
  def show
    @note_book = NoteBook.find(params[:id])
  end

  def edit
    @note_book = NoteBook.find(params[:id])
  end

  def new
    @note_book = NoteBook.new
  end

  def create
    @note_book = NoteBook.new(note_book_params)

    if @note_book.save
      flash[:success] = "Successfully created a notebook"
      redirect_to user_note_book_path(current_user, @note_book)
    else
      render :new
    end
  end

  def update
    @note_book = NoteBook.find(params[:id])
    @note_book.title = 'Notebook title' if @note_book.title.blank?

    if @note_book.update_attributes(note_book_params)
      flash[:success] = 'Changes have been saved.'

      redirect_to user_note_book_path(current_user, @note_book)
    else
      render :edit
    end
  end

  def add_note
    note = current_user.notes.find(params[:note_id])
    note.note_book_id = params[:id]
    note.save!
  end

  def destroy
    @note_book = NoteBook.find(params[:id])
    @note_book.destroy
    flash[:success] = 'Notebook has been deleted.'
    redirect_to user_note_books_path(current_user)
  end

  private
  # Whitelist parameters for mass assignment protection
  def note_book_params
    params.require(:note_book).permit(
      :title
    )
  end
end
