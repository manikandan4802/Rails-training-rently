require 'securerandom'
class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :properties#, dependent: :destroy
  has_many :invitations#, dependent: :destroy
  
  validates :agent_name,:email,:password,:phone_number,:company_name,:role, presence: true
  validates :phone_number, numericality: true 
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  after_create :send_agent_credentials

  def send_agent_credentials
    if Agent.last.role=="Sub Agent"
      invitation=Agent.last
      mail=SubAgentMailer.sub_agent(invitation).deliver_now
    puts(" Success ful **************************************************************")
    end
  end

  # def add_agent
  #   @agent=Agent.last
  #   # debugger
  #   puts("&&&&&&&&&&&&&&&&&&&&&&&&&&&, #{@agent.role}")
  #   if @agent.role=="Sub Agent"
  #     password1=SecureRandom.alphanumeric
  #     # @agent.update(password: password1)
  #     debugger
  #     puts("saved successfully")
  #   else

  #   end
  # end

  def self.authenticate(email, password)
    # debugger
    user = Agent.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def to_s
    self.agent_name
 end
end
