'require bcrypt'

class User
  attr_accessor :password, :password_confirmation

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String
  property :name, String
  property :email, String
  property :password_digest, Text

  has n, :peeps

  validates_presence_of :username, message: "Please fill in username."
  validates_uniqueness_of :username, message: "Username already exists."
  validates_presence_of :name, message: "Please fill in name."
  validates_presence_of :email, message: "Please fill in email."
  validates_uniqueness_of :email, message: "User already exists."
  validates_presence_of :password, message: "Please fill in password."
  validates_presence_of :password_confirmation, message: "Please confirm password."

  before :save do
    if self.password == self.password_confirmation
      self.password_digest = BCrypt::Password.create(self.password)
    else
      break
    end
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def is_creator_of?(resourse)
    resourse.user_id == self.id
  end
end
