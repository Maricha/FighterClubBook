class BooksController < ApplicationController
  before_action :find_book, only: [:edit,:show,:destroy,:delete,:update]

  def rank
    @books = Book.all.sort {|a,b| a.exp <=> b.exp}.reverse
  end

  def index
    @books = Book.all.order('exp')
  end

  def show

  end

  def edit
  end

  def update
    @book = Book.update(book_params)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    n = -1

    p_book_id = Book.order("created_at").all.last
    if p_book_id
      p_book_id = p_book_id.id
    end
      params[:book][:skill_ids].each do |sk|
          n+=1
      end

      if n<3
          flash[:danger] = "Less than 3 skills? Your book should be better."
          redirect_to new_book_path
      elsif n>8
          flash[:danger] = "Ohhh! Your book is to strong for us! Please add only 3-8 skills"
      else

          if @book.save
              book_id = Book.order("created_at").last.id
              params[:book][:skill_ids].each do |skill_id|
                Rel.create(book_id: book_id, skill_id: skill_id)
              end

              #walka
              if p_book_id
                fight(p_book_id, book_id)
                @fight.save
              end

              flash[:success] = "Book added :)"
              redirect_to @book
          else
              render('new')
          end
    end

  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:fname, :sname, :desc, :avatar)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
