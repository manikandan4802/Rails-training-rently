class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :properties#, dependent: :destroy
  has_many :invitations#, dependent: :destroy
  

  def self.authenticate(email, password)
    user = Agent.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def to_s
    self.agent_name
 end
end
