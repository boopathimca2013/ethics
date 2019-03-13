module CommonUtils
	def CommonUtils.encryption(unencrypted_data)
	    begin
	      c = OpenSSL::Cipher.new("aes-256-cbc")
	      c.encrypt
	      c.key = Digest::SHA1.hexdigest('pass')
	      encrypted_data = c.update(unencrypted_data.to_s) + c.final
	      #padding: on encode64 padding as been saving with '+' or '/' and on qr-scan in the url it use to give space, to avoid it added padding: false with urlsafe_encode64
	      encrypted_data = Base64.urlsafe_encode64(encrypted_data, padding: false)
	      encrypted_data.gsub! "\n",""
	      return encrypted_data
	    rescue Exception => exc
	      puts ("Message for the encryption log file for message #{unencrypted_data} = #{exc.message}")
	    end
  end

  	def CommonUtils.decryption(encrypted_data)
    	begin
      		if encrypted_data != ""
        		decrypted_data = Base64.urlsafe_decode64(encrypted_data)
        		c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
        		c.decrypt
        		c.key = Digest::SHA1.hexdigest('pass')
        		decrypted_data = c.update(decrypted_data.to_s) + c.final
        		decrypted_data.gsub! "\n",""
        		return decrypted_data
      		end
    	rescue Exception => exc
      		puts ("Message for the decryption log file for message #{encrypted_data} = #{exc.message}")
    	end
  	end
end