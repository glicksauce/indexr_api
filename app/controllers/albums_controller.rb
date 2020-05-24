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
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
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
    # tagsArr = JSON.parse(params[:id])
    @albums = Album.where(dbx_user_id: params[:user_id]).where(tags: ['map'])

    render json: @albums
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.where(image_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:image_id, :dbx_user_id, :image_path, :image_name, :client_modified_date, :tags)
    end
end
