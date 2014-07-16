# encoding: UTF-8
module Exlsx
	module Cell
		def merge_style(opts = {})
			if @style
				@style = @styles.merge_style(@style, opts)
			else
				@style = @styles.add_style(opts)
			end
		end
	end
end

class Axlsx::Cell
	include Exlsx::Cell
end
