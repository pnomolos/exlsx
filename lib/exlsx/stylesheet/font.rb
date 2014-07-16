# encoding: UTF-8
module Exlsx
	module Font
		include Exlsx::AttributeEquality
		module ClassMethods
			def attributes
				%w{name charset family b i u strike outline shadow condense extend sz color}.map{ |attr| attr.to_sym }
			end
		end

		def dont_duplicate?
			true
		end
	end
end

class Axlsx::Font
	include Exlsx::Font
	extend  Exlsx::Font::ClassMethods
end
