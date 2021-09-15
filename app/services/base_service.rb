class BaseService
 	def self.conn(url)
 		Faraday.new(url)
 	end
 end
