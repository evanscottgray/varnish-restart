require 'sinatra'
require 'json'
require 'haml'

require './lib/restartvarnish'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'varnishrestart' and password == 'Change Me'
end

get '/' do
  @title = 'Varnish Restart'
  haml :home
end

post '/restart' do
  begin
    response = restart_varnish
    unless validate_restart response
      raise ArgumentError, "Something broke, reponse text #{response}"
    end
  rescue Exception => e
    status 400
    body e.inspect.to_s
  end
end
