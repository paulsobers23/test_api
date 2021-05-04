class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def not_found
    render json: {
             'errors': [
                         {
                           'status': '404',
                         'title': 'Not found'}
                       ]},
           status: 404
  end

  def record_invalid(message)
    render json: {
             'errors': [
                         {
                           'status': '400',
                          'title': message
                         }
                       ]
           }, status: 400
  end
end
