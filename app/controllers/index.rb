require 'securerandom'

get '/' do
  # let user create new short URL, display a list of shortened URLs
  # Look in app/views/index.erb
  erb :index
end


post '/urls' do
  # create a new Url
  @random_bits = SecureRandom.urlsafe_base64(6)
  p params[:long_url]
  Url.create(long_url: params[:long_url], short_url: @random_bits, click_counts: 0)

  # redirect '/:short_url'
  erb :show_urls
end

# e.g., /q6bda
get '/:short_url' do
  p params[:short_url]
  # look in database to find cooresponding long url
  found_url = Url.find_by_short_url(params[:short_url])
  puts "after finding url"
  p found_url
  @long_url = found_url.long_url
  "After assigning long url to @long_url"
  p @long_url
  @short_url = "http://localhost:9393/" + found_url.short_url
  erb :show_urls
  # redirect to appropriate "long" URL
  # redirect 'long_url'
end


