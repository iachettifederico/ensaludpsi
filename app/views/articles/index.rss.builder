xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "En Salud Psi"
		xml.description "Artículos relacionados a psicología"
		xml.link articles_url(:rss)
		
		for article in @articles
			xml.item do
				xml.title article.title.capitalize
				xml.description markdown(article.contents)
				xml.pubDate article.created_at.to_s(:rfc822)
				xml.link article_url(article)
			end
		end
	end
end
