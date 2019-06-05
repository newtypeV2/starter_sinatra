class StationController < Sinatra::Base
  set :views, './app/views/stations'

    get '/stations' do
      @stations = Station.all
      erb :index
    end

    get '/stations/new' do
      erb :new
    end
end
