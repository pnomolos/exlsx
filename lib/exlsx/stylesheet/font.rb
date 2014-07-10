module Exlsx
	module Font
		def merge(new_obj)
			%w{name charset family b i u strike outline shadow condense extend sz color}.each do |opt|
				opt = opt.to_sym
				if self.send(opt)
					new_obj.send("#{opt}=", self.send(opt)) unless new_obj.send(opt)
				end
			end
			new_obj
		end
	end
end

class Axlsx::Font
	include Exlsx::Font
end
