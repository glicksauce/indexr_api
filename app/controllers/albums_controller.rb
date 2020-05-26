class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :update, :destroy]

  # GET /albums
  def index
    @albums = Album.all

    render json: @albums
  end

  # GET /albums/1
  def show
    render json: @album

  end

  # POST /albums
  def create
     @albumCheck = Album.where(image_id: album_params[:image_id])
        #  render json: album_params
    if @albumCheck == nil || @albumCheck == []
          @album = Album.new(album_params)
          if @album.save
            render json: @album
          else
            render json: @album.errors, status: :unprocessable_entity
          end
    else
      render json: {"image_id": album_params[:image_id], "record_already_exists": true}
    end

  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(tags: params[:tags])
      # render json: album_params
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
  end

  # tagsearch /users/:user_id/tagsearch/:tags(.:format) 
  def show
    # tagsArr = JSON.parse(params[:tags])
    @albums = Album.where(dbx_user_id: params[:user_id]).in(tags: params[:tags])
    # @albums = Album.where(tags: params[:tags].split(','))
    # @albums = Album.where(:tags => params[:tags].split(','))
    # @albums = Album.where("tags in ?", params[:tags].to_s)
    render json: @albums    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.where(image_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:album_url, :albums_url, :image_id, :dbx_user_id, :image_path, :image_name, :client_modified_date, :tags)
    end
end
