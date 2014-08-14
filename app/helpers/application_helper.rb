module ApplicationHelper
	#retourne titre basé sur la page
	def title
		base_title = "Obii: Get out of your Bubble"
		if @title.nil?
		base_title
		else 
		" #{base_title} | #{@title} "
		end
	end
		
end
