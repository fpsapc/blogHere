# spec/system/user_posts_spec.rb

require 'rails_helper'

RSpec.describe "Post Index", type: :system do
  
  before do
    driven_by(:rack_test)
  end

  user = User.create(name: "Tom Jenkins", photo: "https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=687&amp;q=80", post_counter: 5)

  it "displays the user's profile picture on user posts page" do
  
    visit user_posts_path(user_id: user.id)

   
    expect(page).to have_css("img[src='#{user.photo}']")
   
  end

  it "displays the user's name on user posts page" do
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(user.name)
    end

  it "displays the user's post count on user posts page" do
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(user.post_counter)
    end

  it "displays a post title on user posts page" do
    post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(post.Title)
    end

  it "displays a post text on user posts page" do
    post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(post.Text)
    end

  
  it "displays the first comments on a post" do
    post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
    comment = Comment.create(Text: "This is my first comment", author_id: user.id, post_id: post.id)
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(comment.Text)
    end

    it "displays the number of comments on a post" do
      post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
      comment = Comment.create(Text: "This is my first comment", author_id: user.id, post_id: post.id)
      visit user_posts_path(user_id: user.id)
        
        expect(page).to have_content(post.CommentsCounter)
      end

      it "displays the number of likes on a post" do
        post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
        like = Like.create(author_id: user.id, post_id: post.id)
        visit user_posts_path(user_id: user.id)
          
          expect(page).to have_content(post.LikesCounter)
        end

        it "redirects to post show page when clicking on post title" do
          post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
          visit user_posts_path(user_id: user.id)
          click_link post.Title
          expect(page).to have_current_path(user_post_path(user_id: user.id, id: post.id))
        end
      



  # Add more test scenarios as needed
end
