[
	'open-uri',
	'nokogiri'
].each{|g|
	require g
}

rssArray = [
	'http://scpbc.blog.palmbeachpost.com/feed/',
	# 'http://clikhear.palmbeachpost.com/feed/',
	'http://crime.blog.palmbeachpost.com/feed/',
	'http://dailydolphin.blog.palmbeachpost.com/feed/',
	'http://eyeonthestorm.blog.palmbeachpost.com/feed/',
	'http://feastpb.blog.palmbeachpost.com/feed/',
	'http://featured.blog.palmbeachpost.com/feed/',
	'http://palmbeachhealthbeat.blog.palmbeachpost.com/feed/',
	'http://highschoolbuzz.blog.pbgametime.com/feed/',
	'http://theinsider.blog.palmbeachpost.com/',
	'http://malled.blog.palmbeachpost.com/feed/',
	'http://www.palmbeachpost.com/feeds/categories/news/',
	'http://npbc.blog.palmbeachpost.com/feed/',
	'http://postonpolitics.blog.palmbeachpost.com/feed/',
	'http://postnow.blog.palmbeachpost.com/',
	'http://protectingyourpocket.blog.palmbeachpost.com/feed/',
	'http://realtime.blog.palmbeachpost.com/feed/',
	'http://spbc.blog.palmbeachpost.com/feed/',
	'http://www.palmbeachpost.com/feeds/categories/sports',
	'http://www.palmbeachpost.com/feeds/categories/weather/',
	'http://westpalmbeat.blog.palmbeachpost.com/feed/',
	'http://wpbc.blog.palmbeachpost.com/feed/'
]

File.open("PBPostRSS.txt", "w"){|file|  
	rssArray.each{|rssURL|
		page = Nokogiri::XML(open(rssURL))
		items = page.css('item')
		items.each{|item|
			title = item.css('title').text
			link = item.css('link').text
			description = item.css('description').text
			arr = [
				Date.today.to_s,
				title,
				link,
				Nokogiri::HTML(description).text.gsub("\n",' ')
			]
			file.puts(arr.join("\t"))
			p arr
		}
	}
}
