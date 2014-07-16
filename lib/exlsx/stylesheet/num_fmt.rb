# encoding: UTF-8
module Exlsx
	module NumFmt
		include Exlsx::AttributeEquality
		module ClassMethods
			def attributes
				%w{formatCode}.map{ |attr| attr.to_sym }
			end
		end

		def dont_duplicate?
			true
		end
	end
end

class Axlsx::NumFmt
	include Exlsx::NumFmt
	extend  Exlsx::NumFmt::ClassMethods
end
