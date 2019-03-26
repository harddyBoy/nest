class PicturesController < ActionController::Base
	def create
		@picture = Picture.new(image_params)
		@picture.save

		respond_to do |format|
			format.json {render :json => {url: @picture.image.url(:large), pictude_id: @picture.id } }
		end
	end

	# def create
 #    @image = Image.new(image_params)
 #    @image.save

 #    respond_to do |format|
 #      format.json { render :json => { url: Refile.attachment_url(@image, :image)} }
 #    end
 #  end

	def destroy
		picture = Picture.find(image_params)
		picture.destroy

		respond_to do |format|
			format.json {render json: { status: :ok } }
		end
	end

	private

		def image_params
			params.require(:picture).permit(:image)
		end
end
