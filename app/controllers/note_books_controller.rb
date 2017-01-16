class NoteBooksController < ApplicationController
  def index
    @note_books = current_user.note_books
  end
  def show
    @note_book = note_books.find(params[:id])
  end

  def edit

  end

  def new
    @note_book = NoteBook.new
  end

  def create
    @note_book = note_books.new(note_book_params)

    if @note_book.save
      flash[:success] = "Successfully created a notebook"
      redirect_to user_note_book_path(current_user, @note_book)
    else
      render :new
    end
  end

  private
  # Whitelist parameters for mass assignment protection
  def note_book_params
    params.require(:note_book).permit(
      :title
    )
  end
end
