class User < ApplicationRecord
	def self.get_count(male, female)
		male_arr = male.chars
		female_arr = female.chars
		removed_chars = []
		male_arr.each do |c|
			removed_chars << c if female_arr.include?(c)					
		end
		tot_male_arr = male_arr - removed_chars
		tot_female_arr = female_arr - removed_chars
		tot_chars = tot_male_arr + tot_female_arr
		tot_count = tot_chars.count
		tot_count
	end

	def self.get_match_char(total_count)
		total = total_count
		flames_str = "flames"
		temp = ''
		i = 0
		countt = 0
		n = flames_str.length
		while i < n
			countt += 1
			flag = 0		
			if countt == total
				countt = 0
				#puts "Going to Delete : #{flames_str[i]}"
				temp = flames_str.gsub(flames_str[i], "")
				#puts "temp Hold : #{temp}"
				#puts "Before decrement point: #{temp[i]}"
				i -= 1
				flames_str = temp
				#puts "After Decrement POint : #{flames_str[i]}"
				n = temp.length
				if flames_str.length == 1
					#puts "Good Data : #{flames_str}"
					i = n
				end
			else
				#puts "check = #{countt}"
			end
			if (n-1) == i
				#puts "initailse zero"
				flag = 1
			end
			if flag == 1
				i = 0
			else
				i += 1
			end
			#puts "At end I value : #{i}"
		end
		#puts "return: #{flames_str}"
		flames_str
	end

	def self.get_matchers(sig_char)
		if sig_char == 'f'
			displayString = 'FRIEND'
			displayImage = '<div class="tenor-gif-embed" data-postid="8206438" data-share-method="host" data-width="30%" data-aspect-ratio="1.6711409395973154"></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>'
		elsif sig_char == 'l'	
			displayString = 'LOVE'
			displayImage = '<div class="tenor-gif-embed" data-postid="3527982" data-share-method="host" data-width="30%" data-aspect-ratio="2.4630541871921183"><a href="https://tenor.com/view/tangled-cartoon-animated-love-rapunzel-gif-3527982">Love GIF</a> from <a href="https://tenor.com/search/tangled-gifs">Tangled GIFs</a></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>'
		elsif sig_char == 'a'
		 	displayString = 'AFFECTION'
		 	displayImage = '<div class="tenor-gif-embed" data-postid="7920161" data-share-method="host" data-width="30%" data-aspect-ratio="1.774193548387097"><a href="https://tenor.com/view/tangled-flynn-tease-horse-stop-it-gif-7920161">Tangled Flynn GIF</a> from <a href="https://tenor.com/search/tangled-gifs">Tangled GIFs</a></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>
'
		elsif sig_char == 'm'
	 		displayString = 'MARRIAGE'
	 		displayImage = '<div class="tenor-gif-embed" data-postid="7522235" data-share-method="host" data-width="30%" data-aspect-ratio="0.5625"></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>'
		elsif sig_char == 'e'
			displayString = 'ENEMY'
			displayImage = '<div class="tenor-gif-embed" data-postid="8059006" data-share-method="host" data-width="30%" data-aspect-ratio="1.7777777777777777"></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>'
		else
			displayString='SISTER'
			displayImage = '<div class="tenor-gif-embed" data-postid="9374870" data-share-method="host" data-width="30%" data-aspect-ratio="1.0526315789473684"></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>'
		end
		[displayString, displayImage]
	end
end
