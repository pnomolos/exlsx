# encoding: UTF-8
module Exlsx
	module SerializedAttributes
		def self.included(base)
			base.class_eval do
				def serialized_attributes(str = '', additional_attributes = {})
					attributes = declared_attributes.merge! additional_attributes
					attributes.each do |key, value|
						new_value = Axlsx.camel(value, false).gsub('"','&quot;').gsub("<", '&lt;').gsub(">", '&gt;')
						str << "#{Axlsx.camel(key, false)}=\"#{new_value}\" "
					end
					str
				end
			end
		end
	end
end

module Axlsx
	module SerializedAttributes
		include Exlsx::SerializedAttributes
	end
end
