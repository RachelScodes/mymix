#Mix.r
![logo](url)
Heroku Link: https://rachelscodes-mixr.herokuapp.com/

##Table of Contents
1. [Creators](#coded-and-designed-by)
2. [Technologies](#technologies-used)
3. [ERD](#entity-relationship-diagram)
4. [Overview](#what-is-a-mixtape)
5. [Routes](#routes)
6. [User Stores: How to use Mix.r](#user-stories)
7. [Copyright Notice](#copyright-notice)


##Coded and Designed By:

**Rachel Smyth**
Github: [RachelScodes](https://github.com/RachelScodes)

Markdown Template from: ** [Placehold.r](https://github.com/DBrodsky90/Placeholdr_app) **

**Instructional Leads:** [Syed Salahuddin](), [Colin Hart]()

**Instructional Associates:** [David Brodsky](), [Ben Sayeg]()

##Technologies Used

1. [Ruby](https://github.com/ruby/ruby)
2. [Rails](https://github.com/rails/rails)
3. [PostgreSQL](https://github.com/postgres/postgres)
4. [gem 'bcrypt'](https://github.com/codahale/bcrypt-ruby)


##Entity Relationship Diagram
![ERD](https://raw.githubusercontent.com/RachelScodes/mymix/5918c65dd2bad25c6e9852fa86960e0fa1a3f85c/erd.pdf)

##What is a Mixtape?

First of all, congratulations! You were born after 1996 and have no idea what a cassette tape is. Luckily for you, there's now an app for that.
Mixtape is an app for music makers and lovers alike, to share their favorite songs, in artfully crafted mixtapes, with fun features like ratings and songfacts.


##Routes
![Routes]()

|Prefix	 | Verb	 | URI Pattern	 | Controller#Action   |
|---------|--------|--------------|-------------------   |
| login	 | GET	 | /login(.:format)	 | sessions#new |
| 	 | POST	 | /login(.:format)	 | sessions#create  |
| logout	 | GET	 | /logout(.:format)	 | sessions#destroy |
| signup	 | GET	 | /signup(.:format)	 | users#new  |
| users	 | POST	 | /users(.:format)	 | users#create   |
| user_mixtapes	 | GET	 | /users/:user_id/mixtapes(.:format)	 | mixtapes#index   |
| 	 | POST	 | /users/:user_id/mixtapes(.:format)	 | mixtapes#create  |
| new_user_mixtape	 | GET	 | /users/:user_id/mixtapes/new(.:format)	 | mixtapes#new |
| edit_user_mixtape	 | GET	 | /users/:user_id/mixtapes/:id/edit(.:format)	 | mixtapes#edit   |
| user_mixtape	 | GET	 | /users/:user_id/mixtapes/:id(.:format)	 | mixtapes#show |
| 	 | PATCH	 | /users/:user_id/mixtapes/:id(.:format)	 | mixtapes#update   |
| 	 | PUT	 | /users/:user_id/mixtapes/:id(.:format)	 | mixtapes#update  |
| 	 | DELETE	 | /users/:user_id/mixtapes/:id(.:format)	 | mixtapes#destroy |
| user_songs	 | GET	 | /users/:user_id/songs(.:format)	 | songs#index   |
| 	 | POST	 | /users/:user_id/songs(.:format)	 | songs#create  |
| new_user_song	 | GET	 | /users/:user_id/songs/new(.:format)	 | songs#new |
| edit_user_song	 | GET	 | /users/:user_id/songs/:id/edit(.:format)	 | songs#edit   |
| user_song	 | GET	 | /users/:user_id/songs/:id(.:format)	 | songs#show |
| 	 | PATCH	 | /users/:user_id/songs/:id(.:format)	 | songs#update   |
| 	 | PUT	 | /users/:user_id/songs/:id(.:format)	 | songs#update  |
| 	 | DELETE	 | /users/:user_id/songs/:id(.:format)	 | songs#destroy |
| 	 | GET	 | /users(.:format)	 | users#index |
| 	 | POST	 | /users(.:format)	 | users#create  |
| new_user	 | GET	 | /users/new(.:format)	 | users#new   |
| edit_user	 | GET	 | /users/:id/edit(.:format)	 | users#edit  |
| user	 | GET	 | /users/:id(.:format)	 | users#show   |
| 	 | PATCH	 | /users/:id(.:format)	 | users#update   |
| 	 | PUT	 | /users/:id(.:format)	 | users#update  |
| 	 | DELETE	 | /users/:id(.:format)	 | users#destroy |
| mixtape_songs	 | GET	 | /mixtapes/:mixtape_id/songs(.:format)	 | songs#index   |
| 	 | POST	 | /mixtapes/:mixtape_id/songs(.:format)	 | songs#create  |
| new_mixtape_song	 | GET	 | /mixtapes/:mixtape_id/songs/new(.:format)	 | songs#new |
| edit_mixtape_song	 | GET	 | /mixtapes/:mixtape_id/songs/:id/edit(.:format)	 | songs#edit   |
| mixtape_song	 | GET	 | /mixtapes/:mixtape_id/songs/:id(.:format)	 | songs#show |
| 	 | PATCH	 | /mixtapes/:mixtape_id/songs/:id(.:format)	 | songs#update   |
| 	 | PUT	 | /mixtapes/:mixtape_id/songs/:id(.:format)	 | songs#update  |
| 	 | DELETE	 | /mixtapes/:mixtape_id/songs/:id(.:format)	 | songs#destroy |
| mixtapes	 | GET	 | /mixtapes(.:format)	 | mixtapes#index  |
| 	 | POST	 | /mixtapes(.:format)	 | mixtapes#create  |
| new_mixtape	 | GET	 | /mixtapes/new(.:format)	 | mixtapes#new   |
| edit_mixtape	 | GET	 | /mixtapes/:id/edit(.:format)	 | mixtapes#edit  |
| mixtape	 | GET	 | /mixtapes/:id(.:format)	 | mixtapes#show   |
| 	 | PATCH	 | /mixtapes/:id(.:format)	 | mixtapes#update   |
| 	 | PUT	 | /mixtapes/:id(.:format)	 | mixtapes#update  |
| 	 | DELETE	 | /mixtapes/:id(.:format)	 | mixtapes#destroy |
| songs	 | GET	 | /songs(.:format)	 | songs#index  |
| 	 | POST	 | /songs(.:format)	 | songs#create  |
| new_song	 | GET	 | /songs/new(.:format)	 | songs#new   |
| edit_song	 | GET	 | /songs/:id/edit(.:format)	 | songs#edit  |
| song	 | GET	 | /songs/:id(.:format)	 | songs#show   |
| 	 | PATCH	 | /songs/:id(.:format)	 | songs#update   |
| 	 | PUT	 | /songs/:id(.:format)	 | songs#update  |
| 	 | DELETE	 | /songs/:id(.:format)	 | songs#destroy |

##Playing with Mix.r
###User Stories:

  1. [x] Browse Songs and Mixtapes as a guest from the homepage
  1. [ ] Search for Songs or Mixes by tag?
  1. [ ] View search results?
  1. [x] View user profiles
  1. [x] View user contributions
  1. [ ] Browse Top-Rated Mixes and Songs
  1. [x] Play songs? God forbid?
  1. [x] Create Account, Log in

 Once logged in:
  1. [x] Create & Edit Mixtapes
  1. [x] Create & Edit songs
  1. [ ] Add/Remove songs on Mixtapes
  1. [ ] Dedicate a Mixtape to another User
  1. [ ] Upvote/Downvote Songs and Mixtapes
  1. [ ] See your dedications
  1. [x] View Song details, including "Facts"
  1. [ ] Add "Facts" to Songs
  1. [x] Logout


##Copyright Notice
The images and music used in this app are for an educational project only and not for mass distribution or for profit.
