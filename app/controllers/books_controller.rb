class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search_by_title_and_author_and_genre(params[:query])
    else
      @books = Book.all
    end

    @markers = @books.geocoded.map do |book|
      {
        lat: book.latitude,
        lng: book.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {book: book}),
        marker_html: render_to_string(partial: "marker")
      }
    end

  end

  def show
    @book = Book.find(params[:id])
    @reservation = Reservation.new
    @bookmarkers = [@book.latitude, @book.longitude]

    @markers =
      {
        lat: @book.latitude,
        lng: @book.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {book:  @book}),
        marker_html: render_to_string(partial: "minimarker")
      }
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :photo, :author, :genre, :synopsis, :release_date, :address)
  end
end
