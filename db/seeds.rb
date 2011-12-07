require 'csv'

CSV.foreach "lib/RealTimeHeavyRailKeys.csv" do |row|
	Stations.create(:line => row[0],
					:platformkey => row[1],
					:platformname => row[2],
					:stationname => row[3],
					:platformorder => row[4],
					:startofline => row[5],
					:endofline => row[6],
					:branch => row[7],
					:direction => row[8],
					:stop_id => row[9],
					:stop_name => row[11],
					:stop_lat => row[13],
					:stop_lon => row[14])
end