class BooksController < ApplicationController
    def new
        @book = Book.new
        @book = Book.all
    end
    
    def create
        @book = Book.new(books_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to books_new_path
    end
    
    def index
        @book = Book.all
        @books = Book.new
    end
    
    def show
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_new_path
    end
    
    private
    
    def books_params
        params.require(:book).permit(:title, :body)
    end

end
