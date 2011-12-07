include GeoKit::Geocoders
require 'net/http'
require 'uri'
require 'json'


class StationsController < ApplicationController
	def index
		ip = request.remote_ip
		if ip == "127.0.0.1"
			ip = "130.64.185.219"
		end
		@user_location = MultiGeocoder.geocode(ip)
		@closest_station = Stations.geo_scope(:origin => [@user_location.lat, @user_location.lng], :within => 3).order('distance asc').first
		@all_stations = Stations.all.uniq_by {|h| h.stop_id}

	end
	
	def station	
		@Station = Stations.where('stop_id = ?',params[:stop_id])
		
		respond_to do |format|
			format.json {render :json => @Station.to_json}
		end
	end
	
	def find_closest_stations
		@Stations = Stations.geo_scope(:origin => [params[:lat], params[:lon]], :within => 5).order('distance asc')
		render :json => @Stations.to_json		
	end
	
	def station_schedule
		stations = Stations.where('stop_id = ?', params[:stop_id]).select("stop_name, platformkey, direction, stop_lat, stop_lon, stop_id")

		#HTTP request
		results = Array.new 
		response_red = Net::HTTP.get_response(URI.parse("http://developer.mbta.com/Data/red.json")).body
		response_blue = Net::HTTP.get_response(URI.parse("http://developer.mbta.com/Data/blue.json")).body
		response_orange = Net::HTTP.get_response(URI.parse("http://developer.mbta.com/Data/orange.json")).body
		result_red = JSON.parse(response_red)
		result_blue = JSON.parse(response_blue)
		result_orange = JSON.parse(response_orange)
		results.concat(result_red)
		results.concat(result_blue)
		results.concat(result_orange)
		
		#organize external API
		station_info = Array.new
		stations.each do |station|
			key = station[:platformkey]
			results.each do |red|
				if red["PlatformKey"] == key
					red[:stop_name] = station[:stop_name]
					red[:direction] = station[:direction]
					red[:stop_lat] = station[:stop_lat]
					red[:stop_lon] = station[:stop_lon]
					red[:stop_id] = station[:stop_id]
					station_info.push(red) 
				end	
			end
		end
					
		render :json => station_info.to_json
	end	
end
