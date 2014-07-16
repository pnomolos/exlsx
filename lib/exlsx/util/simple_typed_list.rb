# encoding: UTF-8
module Exlsx
	module SimpleTypedList
		def self.included(base)
			base.class_eval do
				# Concat operator, overriden to not duplicate objects (if they respond to dont_duplicate?)
				# @param [Any] v the data to be added
				# @raise [ArgumentError] if the value being added is not one fo the allowed types
				# @return [Integer] returns the index of the item added.
				def <<(v)
					Axlsx::DataTypeValidator.validate "SimpleTypedList.<<", @allowed_types, v
					idx = nil
					if v.respond_to?(:dont_duplicate?) && v.dont_duplicate? && idx = @list.index(v)
						idx
					else
						@list << v
						idx = @list.size - 1
					end
					idx
				end
			end
		end
	end
end

class Axlsx::SimpleTypedList
	include Exlsx::SimpleTypedList
end
