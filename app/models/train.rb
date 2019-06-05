class Train < ActiveRecord::Base
    has_many :station_trains
    has_many :stations, through: :station_trains
end