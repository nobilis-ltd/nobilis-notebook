class NoteBooksController < ApplicationController
  before_action :require_user
  def index
    @note_book = NoteBook.all
  end

  def show
    @note_book = NoteBook.find(params[:id])
  end

  def new
    @note_book = current_user.NoteBook.new
    # grab current notes from the db associated with this user
    @notes = Note.all
  end

  def edit
    @note_book = current_user.note_books.find(params[:id])
  end

  def create
    @note_book = NoteBook.new(note_book_params)
    @note_book.name = "New notebook" if @note_book.name.blank?

    if @note_book.save
      flash[:success] = 'Your notebook has been created.'

      redirect_to :action => 'index'
    else
      render :new
    end
  end

  private
    def note_book_params
      params.require(:note_book).permit(
        :name
      )
    end
end
