class CommentsController < ApplicationController
  # /comments?category_id=:id
  # /comments?photo_id=:id
  def create
    p params[:category_id]
    p params[:photo_id]
    if params[:category_id]
      category = Category.find(params[:category_id])
      category.comments.create(body: params[:body])
      redirect_to category_path(category)
    elsif params[:photo_id]
      photo = Photo.find(params[:photo_id])
      photo.comments.create(body: params[:body])
      redirect_to photo_path(photo)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    type = @comment.commentable
    @comment.destroy
    if type.is_a?(Category)
      redirect_to category_path(type), status: :see_other
    else
      redirect_to photo_path(type), status: :see_other
    end
  end
end
