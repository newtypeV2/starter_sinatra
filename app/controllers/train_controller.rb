class TrainController < Sinatra::Base
  set :views, './app/views/trains'

    get '/trains' do
      @trains = Train.all
      erb :index
    end

    get '/trains/new' do
      erb :new
    end

    post '/trains' do
      train = Train.create(line_color: params["line_color"], series: params["series"], cars: params["cars"], destination_name: params["destination_name"])
      # binding.pry
      redirect '/trains/#{train.id}'
    end

    get '/trains/:id' do
      @train = Train.find(params[:id])
      erb :show
    end
end
