class Stations < ActiveRecord::Base
	acts_as_mappable   :lat_column_name => :stop_lat,
                   :lng_column_name => :stop_lon
end
