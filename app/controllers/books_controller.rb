class BooksController < ApplicationController

    def new
        @book = Book.new
        @book = Book.all
    end
    
    def create
        @book = Book.new(books_params)
        @book.user_id = current_user.id
      if
        @book.save
        redirect_to book_path(@book.user_id)
      else
        render "show"
      end
    end
    
    def index
        @books = Book.all
        @book = Book.new
        @user = current_user
    end
    
    def show
        @books = Book.new
        @book = Book.find(params[:id])
        @user = @book.user
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
      if @book.update(books_params)
         redirect_to book_path(@book.id)  
      else
         redirect_to "edit"
      end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    
    private
    
    def books_params
        params.require(:book).permit(:title, :body)
    end
    
end
