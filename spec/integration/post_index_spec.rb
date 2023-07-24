# spec/system/user_posts_spec.rb

require 'rails_helper'

RSpec.describe "Post Index", type: :system do
  
  before do
    driven_by(:rack_test)
  end

  user = User.create(name: "Tom Jenkins", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI5QUajL66Kkwz9efY-xCyC_Bq97XyTvgPmndMocETt62-ps3VjrzLtWNrDq_Y5qa5fQ", posts_counter: 5)

  it "displays the user's profile picture on user posts page" do
  
    visit users_path(user_id: user.id)

   
    expect(page).to have_css("img[src='#{user.photo}']")
   
  end

  it "displays the user's name on user posts page" do
    visit users_path(user_id: user.id)
      
      expect(page).to have_content(user.name)
    end

  it "displays the user's post count on user posts page" do
    visit users_path(user_id: user.id)
      
      expect(page).to have_content(user.posts_counter)
    end

  it "displays a post title on user posts page" do
    user = User.create(name: "Tom Jenkins", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI5QUajL66Kkwz9efY-xCyC_Bq97XyTvgPmndMocETt62-ps3VjrzLtWNrDq_Y5qa5fQ", posts_counter: 5)

    post = Post.create(title: "My First Post", text: "This is my first post", author_id: user.id, comments_counter: 0, likes_counter: 0)
    
    
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(post.title)
    end

  it "displays a post text on user posts page" do
    user = User.create(name: "Tom Jenkins", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI5QUajL66Kkwz9efY-xCyC_Bq97XyTvgPmndMocETt62-ps3VjrzLtWNrDq_Y5qa5fQ", posts_counter: 5)

    post = Post.create(title: "My First Post", text: "This is my first post", author_id: user.id, comments_counter: 0, likes_counter: 0)
    
    visit user_posts_path(user_id: user.id)
      
      expect(page).to have_content(post.text)
    end

  
  it "displays the first comments on a post" do
  
    user = User.create(name: "Tom Jenkins", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI5QUajL66Kkwz9efY-xCyC_Bq97XyTvgPmndMocETt62-ps3VjrzLtWNrDq_Y5qa5fQ", posts_counter: 5)

    post = Post.create(title: "My First Post", text: "This is my first post", author_id: user.id, comments_counter: 0, likes_counter: 0)
    comment = Comment.create(text: "This is my first comment", author_id: user.id, post_id: post.id)
    visit user_posts_path(user_id: user.id)
    
    
      expect(page).to have_content(comment.text)
    end

#     it "displays the number of comments on a post" do
#       post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
#       comment = Comment.create(Text: "This is my first comment", author_id: user.id, post_id: post.id)
#       visit user_posts_path(user_id: user.id)
        
#         expect(page).to have_content(post.CommentsCounter)
#       end

#       it "displays the number of likes on a post" do
#         post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
#         like = Like.create(author_id: user.id, post_id: post.id)
#         visit user_posts_path(user_id: user.id)
          
#           expect(page).to have_content(post.LikesCounter)
#         end

#         it "redirects to post show page when clicking on post title" do
#           post = Post.create(Title: "My First Post", Text: "This is my first post", author_id: user.id, CommentsCounter: 0, LikesCounter: 0)
#           visit user_posts_path(user_id: user.id)
#           click_link post.Title
#           expect(page).to have_current_path(user_post_path(user_id: user.id, id: post.id))
#         end
      



  # Add more test scenarios as needed
end
