#Mix.r
![Mixr-Logo](https://raw.githubusercontent.com/RachelScodes/mymix/habtmUniq/mixr-logo.png)
Heroku Link: https://rachelscodes-mixr.herokuapp.com/

##Table of Contents
1. [Creators](#coded-and-designed-by)
2. [Technologies](#technologies-used)
3. [ERD](#entity-relationship-diagram)
4. [Overview](#what-is-a-mixtape)
5. [Routes](#routes)
6. [User Stores: How to use Mix.r](#user-stories)
7. [Wireframes/Flow diagrams](#wireframes)
8. [Copyright Notice](#copyright-notice)


##Coded and Designed By:

**Rachel Smyth**
Github: [RachelScodes](https://github.com/RachelScodes)

Markdown Template from: **[Placehold.r](https://github.com/DBrodsky90/Placeholdr_app)**

**Instructional Leads:** [Syed Salahuddin](), [Colin Hart]()

**Instructional Associates:** [David Brodsky](), [Ben Sayeg]()

##Technologies Used

1. [Ruby](https://github.com/ruby/ruby)
2. [Rails](https://github.com/rails/rails)
3. [PostgreSQL](https://github.com/postgres/postgres)
4. [gem 'bcrypt'](https://github.com/codahale/bcrypt-ruby)
5. [pixlr.com](https://pixlr.com/editor/) Image editor
6. Google fonts


##Entity Relationship Diagram
![ERD](https://raw.githubusercontent.com/RachelScodes/mymix/habtmUniq/erd-current.png)

##What is a Mixtape?

First of all, congratulations! You were born after 1996 and have no idea what a cassette tape is. Luckily for you, there's now an app for that.
Mixtape is an app for music makers and lovers alike, to share their favorite songs, in artfully crafted mixtapes, with fun features like ratings and songfacts.


##Routes
![Routes]()

|Prefix	 | Verb	 | URI Pattern	 | Controller#Action   |
|---------|--------|--------------|-------------------   |
| root    | GET    | /  |welcome#index|
| login	 | GET	 | /login(.:format)	 | sessions#new |
| 	 | POST	 | /login(.:format)	 | sessions#create  |
| logout	 | GET	 | /logout(.:format)	 | sessions#destroy |
| signup	 | GET	 | /signup(.:format)	 | users#new  |
| users	 | POST	 | /users(.:format)	 | users#create   |
| 	 | GET	 | /users(.:format)	 | users#index   |
| users	 | POST	 | /users(.:format)	 | users#create   | I have no idea why this is listed twice |
| new_user	 | GET	 | /users/new(.:format)	 | users#new   |
| edit_user	 | GET	 | /users/:id/edit(.:format)	 | users#edit  |
| user	 | GET	 | /users/:id(.:format)	 | users#show   |
| 	 | PATCH	 | /users/:id(.:format)	 | users#update   |
| 	 | PUT	 | /users/:id(.:format)	 | users#update  |
| 	 | DELETE	 | /users/:id(.:format)	 | users#destroy |
|record_song_mixtape | POST  |  /mixtapes/:id/record_song(.:format) | mixtapes#record_song |
| erase_song_mixtape | GET  |   /mixtapes/:id/erase_song(.:format) | mixtapes#erase_song |
| mixtapes	 | GET	 | /mixtapes(.:format)	 | mixtapes#index  |
| 	 | POST	 | /mixtapes(.:format)	 | mixtapes#create  |
| new_mixtape	 | GET	 | /mixtapes/new(.:format)	 | mixtapes#new   |
| edit_mixtape	 | GET	 | /mixtapes/:id/edit(.:format)	| mixtapes#edit |
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

As a user I can enjoy two experiences: as a guest or as a creator.

As a guest, I can:
  1. [x] Browse Songs and Mixtapes
  1. [x] View user profiles and contributions
  1. [x] Play songs?
  1. [x] Create an Account,
  1. [x] Log in/log out

Once logged in, I can:
  1. [x] Do all of the above, plus:
  1. [x] Create & Edit Mixtapes and Songs
  1. [x] Add/Remove songs on Mixtapes
  1. [x] Add/Remove songs from Mix.r Library
  1. [x] View Song & Mixtape details
  1. [x] Delete content I have created
  1. [x] View and edit Account details
  1. [ ] Delete account
  1. [x] Logout

Things I don't want to do as a user:
  1. [x] Create content as someone else
  1. [x] Edit or delete someone else's content
  1. [x] Edit or delete someone else's account

##Wireframes
![Wireframe](https://raw.githubusercontent.com/RachelScodes/mymix/habtmUniq/Wireframes.png)
![Flowchart](https://raw.githubusercontent.com/RachelScodes/mymix/habtmUniq/mixr-flow.png)

##Copyright Notice
The images and music used in this app are for an educational project only and not for mass distribution or for profit.
