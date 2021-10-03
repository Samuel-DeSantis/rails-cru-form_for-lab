class GenresController < ApplicationController
    
    def show
        @genre = Genre.find(params[:id])
    end
    
    def new
        @genre = Genre.new
    end

    def create
        redirect_to genre_path(Genre.create(safe_genre_params(:name)))
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(safe_genre_params(:name))
        redirect_to genre_path(@genre)
    end

    private

    def safe_genre_params(*args)
        params.require(:genre).permit(*args)
    end

end