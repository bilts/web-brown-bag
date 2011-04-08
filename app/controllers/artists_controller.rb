class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.xml
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artists }
      format.json  { render :json => @artists }
    end
  end
end
