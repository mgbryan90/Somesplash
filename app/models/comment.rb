class Comment < ApplicationRecord
  # Validates
  # Associations
  belongs_to :commentable, polymorphic: true

  after_create :increase_photo_comments_count
  after_destroy :decrease_photo_comments_count

  private

  def increase_photo_comments_count
    return unless commentable.is_a?(Photo)

    comment_photo = commentable
    comment_photo.comments_count += 1
    comment_photo.save
  end

  def decrease_photo_comments_count
    return unless commentable.is_a?(Photo)

    comment_photo = commentable
    comment_photo.comments_count -= 1
    comment_photo.save
  end
end
