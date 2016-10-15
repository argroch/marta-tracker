class StationController < ApplicationController

  include StationHelper

  def index
  end

  def bus_tracker
    if params[:address] != nil
      @user_location = "#{params[:address]}, #{params[:city]}"

      response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@user_location}&key=#{ENV['google_api_key']}")

      @user_coords = response["results"][0]["geometry"]["location"]
      # {"lat"=> 0.0, "lng"=> 0.0}

    	buses = HTTParty.get('http://developer.itsmarta.com/BRDRestService/RestBusRealTimeService/GetAllBus')

      @nearby_buses = []

      buses.each do |bus|
        if nearby(@user_coords["lng"], @user_coords["lat"], bus["LONGITUDE"].to_f, bus["LATITUDE"].to_f)
          @nearby_buses.push(bus)
        end
      end
    end
  end

  def train_tracker
  	trains = HTTParty.get("http://developer.itsmarta.com/RealtimeTrain/RestServiceNextTrain/GetRealtimeArrivals?apikey=#{ENV['marta_api_key']}")

  	@stations = []

  	trains.each do |t|
  		@stations.push(t["STATION"])
  	end

  	@stations.uniq!

  	if params[:station] != nil
  		@my_station = params[:station]

  		@coming_trains = []

  		trains.each do |train|
  			if @my_station == train["STATION"]
  				@coming_trains.push(train)
  			end
  		end
  	end
  end
end
