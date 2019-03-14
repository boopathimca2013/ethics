class UsersController < ApplicationController
	def index
	end

	def new
	end

	def create
		male_name = params[:male_name].to_s.upcase
		female_name = params[:female_name].to_s.upcase
		address = params[:address]
		ipaddress = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
		latitude = params[:latitude]
		logitude = params[:logitude]
		create_flag = false
		if male_name.present? && female_name.present? && male_name.size < 50 && female_name.size < 50
			users = User.where("male_name = ? and female_name = ?", male_name, female_name)
			@users_count = users.count
			user = User.new({male_name: male_name, female_name: female_name, address: address, ipaddress: ipaddress, latitude: latitude, logitude: logitude})
			user.save!
			create_flag = true
		end
		if create_flag
			redirect_to("/users/show/#{CommonUtils.encryption(male_name)}/#{CommonUtils.encryption(female_name)}") and return;
		else
			render plain: "Please fill Both Fields"
		end
	end

	def show
		@male_name = CommonUtils.decryption(params["male_name"]) 
		@female_name = CommonUtils.decryption(params["female_name"])
		if @male_name.nil? || @female_name.nil? || @male_name.include?("Message for the encryption log file") || @female_name.include?("Message for the encryption log file")
			render "new"
		else
			total_count = User.get_count(@male_name, @female_name)
			sig_char = User.get_match_char(total_count)
			@display_str, @display_image = User.get_matchers(sig_char)
		end
	end

	def show_address	
		lat = params["latitude"].to_f
		long = params["logitude"].to_f
		if lat == 0.0 || long == 0.0
			ipaddress = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
			results = Geocoder.search(ipaddress)
			result = results.first
			full_address = "#{result.data['city']} #{result.data['region']}"
		else
			results = Geocoder.search([lat, long])
			full_address = results.first.data["display_name"]
		end	
		render :json => {"address" => full_address}
	end

end
