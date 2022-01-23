# Preview all emails at http://localhost:3000/rails/mailers/invite
class InvitePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invite/invite_created
  def invite_created
    InviteMailer.invite_created
  end

end
