# encoding: UTF-8
module Exlsx
	module Cell
		def merge_style(opts = {})
			@style = row.worksheet.workbook.styles.merge_style(self.style, opts)
		end
	end
end

class Axlsx::Cell
	include Exlsx::Cell
end
