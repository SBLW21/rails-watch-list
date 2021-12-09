class BookmarksController < ApplicationController

  def new
   @list = List.find(params[:list_id])
   @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(params_bookmark) # associe comment du formulaire au bookmark
    @bookmark.movie_id = params[:bookmark][:movie_id] # associe film au book mark
    @bookmark.list = @list #associe list au book
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
