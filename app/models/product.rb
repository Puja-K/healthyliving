class Product < ActiveRecord::Base
	validates :name,      :presence => true, :if => :active_or_name?
 	validates :price,     :presence => true, :if => :active_or_price?
    validates :category,  :presence => true, :if => :active_or_category?

	def active?
    status == 'active'
  end

  def active_or_name?
    (status || '').include?('name') || active?
  end

  def active_or_price?
    (status || '').include?('price') || active?
  end

  def active_or_category?
    (status || '').include?('category') || active?
  end

end
