class User < ActiveRecord::Base
   has_secure_password

   has_many :mixtapes
   has_many :songs

   # can't be blank
   validates :dj_name, :email, presence: true

   # there can only be one #{dj_name}!
   validates :dj_name, uniqueness: {
      case_sensitive: false,
      message: "belongs to someone else, and there can only be one."
   }

   # one account per email address.
   validates :email, uniqueness: {
      case_sensitive: false,
      message: "is already associated with an account." }

   # string@string.string format for email
   validates :email, format: { with: /\A\S+@.+\.\S+\z/,
      message: "Your email should be in foo@bar.com format" }
end
