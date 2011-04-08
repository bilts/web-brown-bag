class SongsController < ApplicationController
  # GET /songs
  # GET /songs.xml
  def index
    @selected_title = params[:title].presence
    @selected_artists = Artist.find(Array.wrap(params[:artists]))

    @artists = Artist.all

    # TODO Accomplish the following two lines using ActiveRecord
    @songs = @selected_title ? Song.where("songs.name LIKE ?", "%#{params[:title]}%") : Song.all
    @songs &= @selected_artists.map(&:albums).flatten.map(&:songs).flatten if @selected_artists.present?

    [@artists, @selected_artists, @songs].each(&:sort!)

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
