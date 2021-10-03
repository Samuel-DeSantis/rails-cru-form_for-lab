class ArtistsController < ApplicationController

    def show
        @artist = Artist.find(params[:id])
    end
    
    def new
        @artist = Artist.new
    end

    def create
        redirect_to artist_path(Artist.create(safe_artist_params(:name, :bio)))
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id]) 
        @artist.update(safe_artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def safe_artist_params(*args)
        params.require(:artist).permit(*args)
    end

end