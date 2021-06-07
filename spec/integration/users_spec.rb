require 'swagger_helper'

RSpec.describe 'Users Api', type: :request do
  path "/api/signup" do
    post 'Create a User' do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
                  type: :object,
                  properties: {
                    email: {type: :string},
                    password: {type: :string}},
                  required: ['email', 'password']}

      response '200', 'user created' do
        let (:user) { {email: "paul@test.com", password: "something"} }
        run_test!
      end

      response '400', 'invaild request' do
        let (:user) {'invaild'}
        run_test!
      end
    end
  end

  path "/api/users/{id}" do
    get 'Return a User' do
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      security [{ bearerAuth: []}]
      response '200', 'from the database successfully' do
        schema type: :object,
               properties: {
                 id: {type: :integer},
                 email: {type: :string},
                 password: {type: :string}},
               required: ['id', 'email', 'password']


        let (:id) {create_user.id}
        run_test!
      end
    end
  end
end
