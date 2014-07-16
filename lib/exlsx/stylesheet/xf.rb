# encoding: UTF-8
module Exlsx
	module Xf
		include Exlsx::AttributeEquality
		module ClassMethods
			def attributes
				%w{alignment protection numFmtId fontId fillId borderId xfId quotePrefix pivotButton applyNumberFormat applyFont applyFill applyBorder applyAlignment applyProtection}.map{ |attr| attr.to_sym }
			end
		end

		def dont_duplicate?
			true
		end
	end
end

class Axlsx::Xf
	include Exlsx::Xf
	extend  Exlsx::Xf::ClassMethods
end
