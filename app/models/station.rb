class Station < ActiveRecord::Base
    has_many :station_trains
    has_many :trains, through: :station_trains

end