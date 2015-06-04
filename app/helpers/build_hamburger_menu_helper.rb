module BuildHamburgerMenuHelper
	def toplevelmenu
		@categories = Category.all.order("name DESC")
	end
end