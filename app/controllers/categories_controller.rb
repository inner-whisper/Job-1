class CategoriesController < ApplicationController
def index
		@categories = Category.all
	end  

	def new
		@category = Category.new
		respond_to do |format|
			format.html # index.html.erb
			format.xml { render :xml => @category }
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])

		respond_to do |format|
			if @category.update_attributes(params[:category])
				format.html { redirect_to(@category, :notice => 'category was successfully updated')}
				format.xml { head :ok }
			else
				format.html { render :action => "edit"}
				format.xml { render :xml => category_errors, :status => :unprocessable_entity }
			end
		end
	end

	def create
		@category = Category.new(params[:category])
      
		respond_to do |format|
			if @category.save
				format.html {redirect_to(@category, :notice => 'category was successfully created')}
			else
				format.html (render :action => 'new')
				format.xml { render :xml => @category.errors, :status => :unprocessable_entity}
			end
		end
	end


	def show
		@category = Category.find(params[:id])
	end

	def delete
		@category = Category.find(params[:id])
		@category.destroy

		respond_to do |format|
			format.html {redirect_to(category_url)}
			format.xml { head :ok }
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		respond_to do |format|
			format.html {redirect_to(categories_url)}
			format.xml { head :ok }
		end
	end
end

