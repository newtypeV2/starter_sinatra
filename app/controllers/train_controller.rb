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
      # selected_station = Station.find(params["station_ids"])
      # selected_station.each do |station|
      # StationTrain.create(station_id: station.id, train_id: train.id)
      # end
      # train.stations << selected_station
      redirect "/trains/#{train.id}"
    end

    get "/trains/:id" do
      @train = Train.find(params[:id])
      erb :show
    end

    patch "/trains/:id" do
      #still missing validation if no station was selected.
      # train = Train.find(params["id"])
      # train.update(params["train"])
      # selected_station = Station.find(params["station_ids"])
      # station_to_add = selected_station - train.stations
      # station_to_remove = train.stations - selected_station
      # train.stations << station_to_add
      # train.stations -= station_to_remove
      train = Train.find(params["id"])
      train.update(params["train"])
      redirect "/trains/#{train.id}"
    end

    delete "/trains/:id" do
      train = Train.find(params["id"])
      train.destroy
      redirect "/trains"
    end

    get "/trains/:id/edit" do
      @train = Train.find(params["id"])
      @stations = Station.all
      erb :edit
    end

end
