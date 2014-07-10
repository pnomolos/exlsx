# -*- coding: utf-8 -*-

require 'bundler'
Bundler.require(:default)

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'exlsx'

Axlsx::Package.new do |p|
	wb = p.workbook
  wb.add_worksheet(:name => "Test") do |sheet|
    sheet.add_row ["Test"]
    %w(first second third).each { |label| sheet.add_row [label, rand(24)+1] }

		cell = sheet.rows[1].cells[1]

    cell.style = wb.styles.add_style i: true, border: { style: :dashed, color: 'FF000000', edges: [:top]}
    cell.merge_style(sz: 20, b: true, border: { style: :thick, color: 'FF000000', edges: [:bottom]})


  end
  p.serialize('test.xlsx')
end
