class ComentsController < ApplicationController

	def like
	    @coment = Coment.find(params[:id])
	    @coment.like+=1
	    @coment.update
    end

	def create
	 	@coment = Coment.new(coment_params)
	    #@movie.review.build(review_params)
	 	if @coment.save#insert en la BD 

	 		redirect_to "/posts/"+@coment.post.id.to_s, notice: "Comentario creado exitosamente"
	 		#+@movie.id.to_s acceders id =>a una paginna q muestre los deltalles
	 	else
	 		redirect_to "/posts/"+@coment.post.id.to_s, notice: "error " 			
	 	end
	end

	def coment_params
		params.require(:coment).permit(:description, :post_id, :like)
	end
end
