class Business < ActiveRecord::Base
  validates_presence_of :uuid, :name, :address, :city, :state, :zip, :country, :phone, :website, :on => :create_database
end
