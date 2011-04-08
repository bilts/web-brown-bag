class SongsController < ApplicationController
  # GET /songs
  # GET /songs.xml
  def index
    @artists = Artist.all
    @albums = Album.all
    @songs = Song.all
    constraints = []
    if params[:keywords].present?
      @songs = Song.where("songs.name LIKE ?", "%#{params[:keywords]}%")
    else
      @songs = Song.all
    end

    if params[:artists].present?
      @songs = @songs.find_all{|song| params[:artists].include? song.album.artist_id.to_s}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end
end
