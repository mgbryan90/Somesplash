class PhotosController < ApplicationController
  # /photos/new?category_id=:id
  def new
    @photo = Photo.new
    @category = Category.find(params[:category_id])
  end

  def create
    @photo = Photo.new(photo_params)
    @category = Category.find(photo_params[:category_id])
    if @photo.save
      redirect_to category_path(@photo.category)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to category_path(@photo.category)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    category = @photo.category
    @photo.destroy
    redirect_to category_path(category), status: :see_other
  end

  def search
    if params[:query].nil?
      @found_photos = nil
    else
      query = params[:query].downcase
      @found_photos = Photo.where("LOWER(title) LIKE ?", "%#{query}%")
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :image)
  end
end
