module Exlsx
	require 'exlsx/stylesheet/border'
	require 'exlsx/stylesheet/fill'
	require 'exlsx/stylesheet/font'

	module Styles
		def merge_style(style_ref, options = {})
			options[:type] ||= :xf
			raise ArgumentError, "Type must be one of [:xf, :dxf]" unless [:xf, :dxf].include?(options[:type])

			_options = {
				fill:       parse_fill_options(options),
				font:       parse_font_options(options),
				numFmt:     parse_num_fmt_options(options),
				border:     parse_border_options(options),
				alignment:  parse_alignment_options(options),
				protection: parse_protection_options(options)
			}.reject{ |k,v| v.nil? }
			case options[:type]
			when :dxf
				merge_dxf_style(style_ref, _options)
			else
				merge_cellxfs_style(style_ref, _options)
			end
		end

		def merge_dxf_style(style_ref, options = {})
			current_style = dxfs[style_ref]
			options = {
				fill: current_style.fill,
				font: current_style.font,
				numFmt: current_style.numFmt,
				border: current_style.border,
				alignment: current_style.alignment
			}.merge(options)

			dxfs << Axlsx::Dxf.new(options)
		end

		def merge_cellxfs_style(style_ref, options = {})
			current_style = cellXfs[style_ref]

			options = {
				fillId:     current_style.fillId > 0 ? (fills << fills[current_style.fillId].merge(fills[options[:fill]])) : options[:fill],
				fontId:     current_style.fontId > 0 ? (fonts << fonts[current_style.fontId].merge(fonts[options[:font]])) : options[:font],
				borderId:   current_style.borderId > 0 ? (borders << borders[current_style.borderId].merge(borders[options[:border]])) : options[:border],
				numFmtId:   options[:numFmt]     || current_style.numFmtId,
				alignment:  options[:alignment]  || current_style.alignment,
				protection: options[:protection] || current_style.protection
			}

			cellXfs << Axlsx::Xf.new(options)
		end
	end
end

class Axlsx::Styles
	include Exlsx::Styles
end
