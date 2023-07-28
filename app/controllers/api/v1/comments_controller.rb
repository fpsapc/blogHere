class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }

  def index
    user = User.find(params['user_id'])
    post = user.posts.find(params['post_id'])
    comments = post.comments
    render json: comments
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def create
    token = request.headers['X-Token']
    user = User.find_by(api_token: token)
    post = Post.find(params['post_id'])

    puts 'Comment'
    puts 'Comment'
    puts 'Comment'
    puts params

    new_comment = post.comments.new(
      text: params['text'],
      user:
    )

    if new_comment.save
      render json: { success: 'Comment added successfully' }, status: :created
    else
      render json: { error: new_comment.errors.full_messages }, status: :bad_request
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end
end