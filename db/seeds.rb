u1 = User.create(username: "Bob", password: "123456")
u2 = User.create(username: "Bob2", password: "123456")
u3 = User.create(username: "Bob3", password: "123456")
u4 = User.create(username: "Bob4", password: "123456")

l1 = Link.create(user_id: 1, title: "Google", url: "http://www.google.com", body: "Search!")

c1 = Comment.create(body: "Comment body...", user_id: 1, link_id: 1, parent_comment_id: nil)
c2 = Comment.create(body: "Comment body...2", user_id: 2, link_id: 1, parent_comment_id: nil)
c3 = Comment.create(body: "Comment body...3", user_id: 3, link_id: 1, parent_comment_id: nil)


c4 = Comment.create(body: "Comment body...4", user_id: 1, link_id: 1, parent_comment_id: 2)
c5 = Comment.create(body: "Comment body...5", user_id: 2, link_id: 1, parent_comment_id: 4)
c6 = Comment.create(body: "Comment body...6", user_id: 3, link_id: 1, parent_comment_id: 3)