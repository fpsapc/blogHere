require 'rails_helper'

RSpec.describe "Post Show", type: :system do
  before do
    driven_by(:rack_test)
  end

  user = User.create(name: "Tom Jenkins", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI5QUajL66Kkwz9efY-xCyC_Bq97XyTvgPmndMocETt62-ps3VjrzLtWNrDq_Y5qa5fQ", posts_counter: 5)
  post = Post.create(title: "My First Post", text: "This is my first post", author_id: user.id, comments_counter: 0, likes_counter: 0)
 
  comment = Comment.create(text: "This is my first comment", author_id: user.id, post_id: post.id)

  it "displays posts title" do 
    visit user_post_path(user_id: user.id, id: post.id)
    expect(page).to have_content(post.title)
  end

#   it "displays who wrote the post" do
#     visit user_post_path(user_id: user.id, id: post.id)
#     expect(page).to have_content(user.name)
#   end

#   it "displays how many comments the post has" do
#     visit user_post_path(user_id: user.id, id: post.id)
#     expect(page).to have_content(post.CommentsCounter)
#   end

#   it "displays how many likes the post has" do
#     visit user_post_path(user_id: user.id, id: post.id)
#     expect(page).to have_content(post.LikesCounter)
#   end

#   it "displays the post text" do
#     visit user_post_path(user_id: user.id, id: post.id)
#     expect(page).to have_content(post.Text)
#   end

#   it "displays the user name commentor" do
#     visit user_post_path(user_id: user.id, id: post.id)
#     expect(page).to have_content(comment.user.name)
#   end

#   it "displays the comment text" do
#     visit user_post_path(user_id: user.id, id: post.id)
#     expect(page).to have_content(comment.Text)
#   end


end
