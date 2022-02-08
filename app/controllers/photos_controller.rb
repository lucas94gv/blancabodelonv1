class PhotosController < ApplicationController

  layout 'panel_admin'

  before_action :authenticate_user!
  before_action :set_photo, only: %i[ edit update destroy ]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
      @photo = Photo.create(photo_params)
      if @photo.errors.any?
        redirect_to new_photo_path
        flash[:error] = @photo.errors.first.full_message
      else
        redirect_to photos_path 
        flash[:success] = "La imagen se ha subido correctamente."
      end
  end

  def update
    @photo.update(photo_params)

    if @photo.errors.any?
      redirect_to edit_photo_path
      flash[:error] = @photo.errors.first.full_message
    else
      redirect_to photos_path, notice: "La imagen se actualizó correctamente."  
      flash[:success] = "La imagen se actualizó correctamente"
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
    flash[:success] = "La imagen se eliminó correctamente"
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
        params.require(:photo).permit(:title, :image)
    end
end
