class User < ActiveRecord::Base
  validates :username, :hashed_password, :salt, :presence => true
  validates :username, :uniqueness => true

  validates :password, :confirmation => true

  attr_accessor :password_confirmation
  attr_reader :password
  
  validate :password_must_be_present
  
  def User.authenticate(username, password)
     if user = User.find_by_username(username)
       if user.hashed_password == encrypt_password(password, user.salt)
         user
       end
     end


   end

   def User.encrypt_password(password, salt)
     Digest::SHA2.hexdigest(password + "wibble" + salt)
   end

   # 'password' is a virtual attribute
   def password=(password)
     @password = password

     if password.present?
       generate_salt
       self.hashed_password = self.class.encrypt_password(password, salt)
     end
   end

   def User.encrypt_password(password, salt)
     Digest::SHA2.hexdigest(password + "wibble" + salt)
   end

   private

   def password_must_be_present
     errors.add(:password, I18n.translate(:missing)) unless hashed_password.present?
   end


   def generate_salt
     self.salt = self.object_id.to_s + rand.to_s
   end

end
