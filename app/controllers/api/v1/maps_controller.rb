class Api::V1::MapsController < ApplicationController
  include MapsSearch

  before_action :get_customer

  def index
    file_name = "#{Rails.root}/config/maps_attributes.yml"

    unless @customer.present?
      render json: {status: 'error', code: 404, message: 'Customer is required to load results'}
      return
    end

    unless File.exist?(file_name)
      render json: { status: 400, error: 'Configuration file is missing' }
      return
    end

    client_config = get_config(file_name)

    client_api = MapsSearch::Search.new(client_config[@customer])
    api_response = client_api.get_locations

    render json: api_response
  end


  private

  def get_config(file_name)
    YAML.load_file(file_name)
  end

  def get_customer
    @customer = params['customer']
  end
end
