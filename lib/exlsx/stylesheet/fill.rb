module Exlsx
	module Fill
		def merge(new_obj)
			%w{fill_type}.each do |opt|
				opt = opt.to_sym
				if self.send(opt)
					new_obj.send("#{opt}=", self.send(opt)) unless new_obj.send(opt)
				end
			end
			new_obj
		end
	end
end

class Axlsx::Fill
	include Exlsx::Fill
end
