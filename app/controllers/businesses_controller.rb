class BusinessesController < ApplicationController
  require 'csv'
  require 'byebug'

  before_action :check_for_database, only: [:index, :show]

  def index
    business_data = Business.order('id ASC').paginate(:page => params[:page], per_page: 50)
    render json: { status: 200, business: business_data }
  end

  def create_database
    parse_csv

    business_data = Business.new#(business_params)
    if business_data.save
      redirect_to action: "index"
    else
      render json: {
        status: 500,
        message: "Something went wrong."
      }.to_json
    end
  end

  def show
    business_data = Business.find(params[:id])
    if business_data
      render json: { status: 200, business: business_data}
    else
      render json: { status: 500, message: "Something went wrong." }
    end
  end

  def check_for_database
    create_database if !Business.any?
  end

private

def parse_csv
  csv_file = File.read('./businesses.csv')
  csv = CSV.parse(csv_file, :headers => true)
  csv.each do |row|
    Business.create!(row.to_hash)
  end
end

# def business_params
#   params.require(:business)#.permit(:uuid, :name, :address, :address2, :city, :zip, :state, :country, :phone, :website, :created_at)
# end

end
