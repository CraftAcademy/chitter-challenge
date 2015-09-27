require "bcrypt"

class User

  attr_accessor :password, :password_confirm

  include DataMapper::Resource
  include BCrypt

  property :id,                  Serial
  property :name,                String, length: 255
  property :user_name,           String, length: 255, unique: true, message: "This user name is already taken" # TODO: Display to user as necessary
  property :email,               String, format: :email_address, unique: true, message: "This email is already taken" # TODO: Display to user as necessary
  property :password_digest,     Text, length: 255
  property :created_at,          DateTime

  validates_presence_of          :name
  validates_presence_of          :user_name
  validates_presence_of          :email
  # validates_presence_of          :password_digest # TODO: Get working or remove
  # validates_confirmation_of      :password, message: "Your passwords don't match. Try again." # TODO: Get working or remove

  has n, :chits, through: Resource

  before :save do
    if self.password == self.password_confirm
      self.password_digest = BCrypt::Password.create(self.password)
    else
      break # TODO: Flash or otherwise display relevant message to user if/when this code executes
    end
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
