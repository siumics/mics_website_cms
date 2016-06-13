class User < ActiveRecord::Base
  before_save :name_capitalize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :confirmable, :lockable, :timeoutable
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def name_capitalize
    first_name.capitalize!
    last_name.capitalize!
  end

end
