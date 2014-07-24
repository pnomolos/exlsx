# encoding: UTF-8
module Exlsx
	module MergedCells
		def self.included(base)
			base.class_eval do
				def add(cells)
					@list <<
						if cells.is_a?(String)
							cells
						elsif cells.is_a?(Array) || cells.is_a?(Axlsx::SimpleTypedList)
							Axlsx::cell_range(cells, false)
						end
				end
			end
		end
	end
end

module Axlsx
	class MergedCells < SimpleTypedList
		include Exlsx::MergedCells
	end
end
