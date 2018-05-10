# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
- [x] Include user accounts
- [ ] Ensure that users can't modify content created by other users
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Include user input validations
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

Personal
- Use http://www.sandersweb.net/bible/verse.php to scrape random bible verses.
- Or maybe... http://www.thywordistrue.com/verse_generator?
- Or http://www.elijahnotes.com/random-bible-verses-generator/
- Class for Users, Emotions, Posts, Advice
- Users class = duh
- Emotions class = a specific list of emotion verbs
- Interesting research paper on Emotion and Decision Making
https://scholar.harvard.edu/files/jenniferlerner/files/annual_review_manuscript_june_16_final.final_.pdf
- The Feeling Vocabs https://www.ryerson.ca/~jgingras/pdf/Feeling%20Vocabulary.pdf
- Maybe I should scrape bible verses based on the user's emotion:
https://www.biblegateway.com/quicksearch/?quicksearch=hope&qs_version=NIV
https://www.biblestudytools.com/
- Main Emotions - Large Category:
Anger, shame, fear, confident, confused, happy, hurt, love, sad, thankful, worried
- or no no. to be more broad: Anger, Fear, Sad, Happy, Thankful
- functions to include:
- user.emotions, user.verses and emotion.verses
