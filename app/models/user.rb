class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note

  enum role: [ :user, :admin ]

  after_initialize :set_default_role

  private

  def set_default_role
    role ||= :user
  end
end
