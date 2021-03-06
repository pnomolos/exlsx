# encoding: UTF-8
module Exlsx
	module Border
		def dont_duplicate?
			true
		end

		def ==(v)
			false
		end

		def merge(new_obj)
			used_edges = new_obj.prs.map{|pr| pr.name}
			self.prs.each do |pr|
				new_obj.prs << pr.dup unless used_edges.include?(pr.name)
			end
			new_obj
		end
	end
end

class Axlsx::Border
	include Exlsx::Border
end
