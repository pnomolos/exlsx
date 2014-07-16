module Exlsx
	require 'exlsx/stylesheet/border'
	require 'exlsx/stylesheet/fill'
	require 'exlsx/stylesheet/font'
	require 'exlsx/stylesheet/num_fmt'
	require 'exlsx/stylesheet/xf'

	module Styles
		def self.included(base)
			base.class_eval do
				def parse_num_fmt_options(options={})
					return if (options.keys & [:format_code, :num_fmt]).empty?

					#When the user provides format_code - we always need to create a new numFmt object
					#When the type is :dxf we always need to create a new numFmt object
					if options[:format_code] || options[:type] == :dxf
						#If this is a standard xf we pull from numFmts the highest current and increment for num_fmt
						options[:num_fmt] ||= (@numFmts.map{ |num_fmt| num_fmt.numFmtId }.max + 1) if options[:type] != :dxf
						numFmt = Axlsx::NumFmt.new(:numFmtId => options[:num_fmt] || 0, :formatCode=> options[:format_code].to_s)
						options[:type] == :dxf ? numFmt : numFmts[(numFmts << numFmt)].numFmtId
					else
						options[:num_fmt]
					end
				end
			end
		end

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

		def merge_cellxfs_style(style_ref, _options = {})
			return unless style_ref

			current_style = cellXfs[style_ref]

			options = {}
			if _options[:fill]
				options[:fillId] = current_style.fillId > 0 ? (fills << fills[current_style.fillId].merge(fills[_options[:fill]])) : _options[:fill]
			end

			if _options[:font]
				#begin
					options[:fontId] = current_style.fontId > 0 ? (fonts << fonts[current_style.fontId].merge(fonts[_options[:font]])) : _options[:font]
				#rescue
				#	raise _options.inspect + current_style.inspect + fonts.inspect
				#end
			end

			if _options[:border]
				options[:borderId] = current_style.borderId > 0 ? (borders << borders[current_style.borderId].merge(borders[_options[:border]])) : _options[:border]
			end

			options = {
				numFmtId:   _options[:numFmt]     || current_style.numFmtId,
				alignment:  _options[:alignment]  || current_style.alignment,
				protection: _options[:protection] || current_style.protection
			}.merge(options)

			return if 0 == options[:numFmtId] && options.reject{|k,v| :numFmtId == k}.empty?

			cellXfs << Axlsx::Xf.new(options)
		end
	end
end

class Axlsx::Styles
	include Exlsx::Styles
end
