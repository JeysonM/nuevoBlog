class Post < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :content, presence: true #, length:{minimum 25}
	validates :category, presence: true
	has_many :coments
	#belongs_to :user  

	before_save :initialize_like

	def initialize_like
		if self.like==nil
			self.like = 0
		end 
		self.user_id = 1
	end


end
