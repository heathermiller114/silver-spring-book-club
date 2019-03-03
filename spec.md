# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
        Includes models of Member, Book and Review
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        I used a join table for my members and books.
        A member has many books and a book has many members through the join.
        A member also has many reviews.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        A review belongs to a member.
        My join table member_books belongs to members and books.
- [x] Include user accounts with unique login attribute (username or email)
        To sign up or login, a user needs a unique email.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        A member can create/read/update and destroy a book or a review.
- [x] Ensure that users can't modify content created by other users
        A member can only update/destroy a book or review that she created.
- [x] Include user input validations
        A user must have a present and unique email and a present password with at least 8 characters.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        README.md is complete

Confirm
- [x] You have a large number of small Git commits
        63 current commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message