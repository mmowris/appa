class HomeController < ApplicationController
	def index
		if !params[:date].nil?
		@today = Date.parse(params[:date])
	else
		
		@today = Date.today
	end
		@moddedDates = []
		@afterDates = []
		@beforeDates = []

		User.all.map do |i|
			u = Date.new(@today.year,i[:birthdate].month,i[:birthdate].day)
			@moddedDates << {:name => i.name, :birthdate => u}
		end



		@afterDates = @moddedDates.select{|i| i[:birthdate] >= @today}
		puts "First Birthday #{@afterDates.first[:name]}"
		@beforeDates = @moddedDates.select{|i| i[:birthdate] < @today}
		@beforeDates = @beforeDates.sort_by {|i| i[:birthdate]}
		
	end
end
