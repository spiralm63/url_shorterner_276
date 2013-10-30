class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :long_url, :presence => true
  validates :long_url, :format => { :with => /(https|http|ftp):\/\/\w+\.\S*/} 
end
