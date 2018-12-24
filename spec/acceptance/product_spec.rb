require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Products" do

  # get "/products" do
  #   example "List all products" do
  #     do_request
  
  #     expect(status).to eq(200)
  #   end
  # end

  # describe "get #show" do 
  #   context "show product" do
  #     do_request
      
  #     expect(status).to eq(200)
  #   end
  # end

  # post "/products" do
  #   parameter :name, "Name for the product", required: true
  #   parameter :status, "status product"
  #   parameter :price, "price of product"
  #   parameter :location_id, "location of product"
    
  #   example_request "Create a new product" do
  #     name = Faker::Name.name 
  #     price =  Faker::Numbe.decimal(6,2)
  #     status = Faker::Lorem.word
  #     location = Faker::Lorem.sentence

  #     do_request(name: name, price: price, status: status, location_id: location)

  #     expect(status).to eq(200)
  #   end
  # end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
 
  describe "GET #index" do
    it "List all products" do
      Product.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "Show product" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}
      expect(response).to be_successful
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new product" do
        expect {
          post :create, params: {product: valid_attributes}
        }.to change(Product, :count).by(1)
      end

      it "redirects to show page" do
        post :create, params: {product: valid_attributes}
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      it "returns to new page" do
        post :create, params: {product: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end


end