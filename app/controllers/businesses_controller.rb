class BusinessesController < ApplicationController
  require 'csv'
  require 'byebug'

  before_action :parse_csv

  def index
    @businesses = Business.all
  end

  def create
    Business.create(business_params)
  end



private

def parse_csv
  # byebug
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
