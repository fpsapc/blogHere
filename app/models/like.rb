class Like < ApplicationRecord
  belongs_to :post

  after_create :update_post_likes_counter

  def update_post_likes_counter
    post.update_likes_counter
  end
end
