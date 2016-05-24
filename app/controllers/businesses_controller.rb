class BusinessesController < ApplicationController
  require 'csv'
  require 'byebug'

  before_action :parse_csv, only: :create

  def index
    @businesses = Business.order('id ASC').paginate(:page => params[:page], per_page: 50)
    render :json => @businesses
  end

  def create
    Business.create(business_params)
  end

  def show
    @business = Business.find(params[:id])
    render :json => @business
  end

private

def parse_csv
  Business.destroy_all
  csv_file = File.read('./businesses.csv')
  csv = CSV.parse(csv_file, :headers => true)
  csv.each do |row|
    Business.create!(row.to_hash)
  end
end

def business_params
  params.require(:business).permit(:uuid, :name, :address, :address2, :city, :zip, :state, :country, :phone, :website, :created_at)
end

end
