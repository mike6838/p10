class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_many :comments

  validates_presence_of :firstname, :message => "First name must be present"

  validates_presence_of :lastname, :message => "Last name must be present"

  validates_presence_of :email, :message => "Email must be present"

  validates_presence_of :password, :message => "Password name must be present"

  # validates :firstname, presence: true, length: { maximum: 50 }, :message => "First name must be present"
  # validates :lastname, presence: true, length: { maximum: 50 }, :message => "Last name must be present"


  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true,
  #           format: { with: VALID_EMAIL_REGEX },
  #           uniqueness: { case_sensitive: false }, :message => "something"
  # validates :password, presence: true, length: { minimum: 6 }, :message => "Password must be at least six characters"
  # validates :password_confirmation, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
