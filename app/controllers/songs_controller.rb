class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end
    
    def new
        @song = Song.new
    end

    def create
        redirect_to song_path(Song.create(safe_song_params(:name, :artist_id, :genre_id)))
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(safe_song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def safe_song_params(*args)
        params.require(:song).permit(*args)
    end

end