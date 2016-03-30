require 'json'
File.open('/Users/wuminzhe/Downloads/postcode_sql.sql') do |file|
	result = {}
	
	file.each_line do |line|
		str = line.split('VALUES')[1].strip
		segs = str[1 ... str.length-2].split(',')
		provice = segs[1][1 ... segs[1].length-1]
		city = segs[2][1 ... segs[2].length-1]
		county = segs[3][1 ... segs[3].length-1]
		postcode = segs[4]
		
		if result[provice].nil?
			result[provice] = {}
		end

		if county==''
			result[provice][city] = postcode
		else
			if result[provice][city].nil?
				result[provice][city] = {}
			end
			result[provice][city][county] = postcode
		end
	end

	puts result.to_json
end