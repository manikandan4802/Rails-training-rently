require 'rails_helper'

RSpec.describe "Properties", type: :request do
  

  before(:all) do
    @company=FactoryBot.create(:company)
    @agent= FactoryBot.create(:agent,company_id:@company.id)
    @property= FactoryBot.create(:property,:agent_id=>@agent.id)
    # @smart_lock = FactoryBot.create(:smart_lock,:property_id=>@property.id,:company_id=>@company.id)
    #   @lock_code = FactoryBot.create(:lock_code,:property_id=>@property.id,:smart_lock_id=>@smart_lock.id)
      
  end 
  # it "Renter Properties Index Page" do
  #   # sign_in @agent
  #   get properties_path

  #   expect(response).to render_template 'properties/index'

  # end
  it "Agent Properties Index Page" do
    # sign_in @agent
    get properties_path

    expect(response).to render_template 'properties/index'

  end

  # it "Assigning smart_lock" do
  #   # sign_in @agent
  #   patch property_add_smart_lock_path(property_id:@property.id,id:@smart_lock.id)
  #   expect(response).to redirect_to properties_path
  # end 


  it "Deletes the Property" do
    # sign_in @agent
    delete property_path(:id=>@property.id)

    expect(response).to redirect_to properties_path
  end
  
  
  

end