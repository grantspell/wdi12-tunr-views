class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs.all
  end

  def show
  end

  def new
    @song = @artist.songs.new
  end

  def edit
  end

  def create
    @song = @artist.songs.new(song_params)
    
    if @song.save
      redirect_to artist_song_path(@artist, @song)
    else
      redirect_to :back 
    end
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist,@song)
    else
      redirect_to :back 
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = @artist.songs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :album, :preview_url)
    end
end
