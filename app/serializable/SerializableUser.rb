class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attribute :email

  link :self do
    @url_helpers.api_user_url(@object.id) if @object.id
  end
end
