class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @new_artist = Artist.new(artist_params)
    @new_artist.save

    # redirect_to "/artists/#{@new_artist.id}"
    redirect_to artist_path(@new_artist)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)

    redirect_to artist_path(@artist)
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :nationality, :photo_url)
  end
end
