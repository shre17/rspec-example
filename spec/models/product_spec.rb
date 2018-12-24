require 'rails_helper'

RSpec.describe Product, type: :model do

  #Shoulda: :Matchers require to use should in spec
  
  it { should validate_presence_of(:name) } 
  it { should validate_presence_of(:status) } 
  it { should validate_presence_of(:location_id) } 
  it { should validate_presence_of(:price) } 

end
