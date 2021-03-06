# encoding: UTF-8
module Exlsx
	module Fill
		include Exlsx::AttributeEquality
		module ClassMethods
			def attributes
				%w{fill_type}.map{ |attr| attr.to_sym }
			end
		end

		def dont_duplicate?
			true
		end
	end
end

class Axlsx::Fill
	include Exlsx::Fill
	extend  Exlsx::Fill::ClassMethods
end
