class TrainController < Sinatra::Base
  set :views, "./app/views/trains"
  set :method_override, true

    get "/trains" do
      @trains = Train.all
      erb :index
    end

    get "/trains/new" do
      @stations = Station.all
      erb :new
    end

    post "/trains" do
      train = Train.create(params["train"])
      station_ids = params["station"]["id"]
      train.stations << Station.find(station_ids)
      redirect "trains/#{train.id}"
    end

    get "/trains/:id" do
      @train = Train.find(params[:id])
      erb :show
    end

    patch "/trains/:id" do
      train = Train.find(params["id"])
      train.update(params["train"])
      selected_station = Station.find(params["station"]["id"])
      current_stations = train.stations
      newstations = selected_station - current_stations
      train.stations << newstations
      redirect "trains/#{train.id}"
    end

    get "/trains/:id/edit" do
      @train = Train.find(params["id"])
      @stations = Station.all
      erb :edit
    end

end
