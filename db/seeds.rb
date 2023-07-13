first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

4.times do
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  # Verify the post creation
  puts "Post Title: #{first_post.title}"
  puts "Post Author: #{first_post.author.name}"

  # Create comments
  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
  Comment.create(post: first_post, author: second_user, text: 'Nice post!')
  Comment.create(post: first_post, author: second_user, text: 'Keep it up!')
  Comment.create(post: first_post, author: second_user, text: 'Great work!')
  Comment.create(post: first_post, author: second_user, text: 'Awesome!')
  Comment.create(post: first_post, author: second_user, text: 'Well done!')

  # Verify the comments
  puts "Comments for Post: #{first_post.comments.count}"
end

# Find, update, and delete entities
user = User.find_by(name: 'Tom')
puts "User: #{user.name}"
user.update(name: 'Tom Smith')
updated_user = User.find_by(name: 'Tom Smith')
puts "Updated User: #{updated_user.name}"

post = updated_user.posts.find_by(title: 'Hello')
puts "Post Title: #{post.title}" if post
post.update(title: 'Greetings', text: 'This is my updated post') if post
updated_post = updated_user.posts.find_by(title: 'Greetings')
puts "Updated Post Title: #{updated_post.title}" if updated_post

comment = updated_post.comments.find_by(text: 'Hi Tom!') if updated_post
puts "Comment Text: #{comment.text}" if comment
comment.destroy if comment
puts "Comment Count after deletion: #{updated_post.comments.count}" if updated_post
