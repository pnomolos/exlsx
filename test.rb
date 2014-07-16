# encoding: UTF-8

require 'bundler'
Bundler.require(:default)

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'exlsx'

Axlsx::Package.new do |p|
	wb = p.workbook
  wb.add_worksheet(:name => "Test") do |sheet|
    sheet.add_row ["Test"]
		20.times do |n|
			sheet.add_row ["#{n}.53".to_f, rand(24)+1]
			sheet.rows[n+1].cells[0].merge_style({b: true, format_code: '_("$"* #,##0.00_);[Red]_("$"* \(#,##0.00\);_("$"* "-"??_);_(@_)'})
		end

		s = sheet.styles
		puts s.cellXfs.inspect
		puts s.numFmts.inspect

		cell = sheet.rows[1].cells[1]

    cell.style = wb.styles.add_style i: true, border: { style: :dashed, color: 'FF000000', edges: [:top]}
    cell.merge_style(sz: 20, b: true, border: { style: :thick, color: 'FFFF0000', edges: [:bottom]})


  end
  p.serialize('test.xlsx')
end
