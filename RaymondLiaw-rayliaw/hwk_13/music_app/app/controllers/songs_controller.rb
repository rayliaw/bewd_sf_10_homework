class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.build
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)

    if @song.save
      redirect_to artist_path(@artist)
    else
      render 'new'
    end
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to artist_path(params[:artist_id])
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private
    def song_params
      params.require(:song).permit(:name, :genre, :year, :length)
    end
end
