class StatusesController < ApplicationController
def index
		@statuses = Status.all
	end  

	def new
		@status = Status.new
		respond_to do |format|
			format.html # index.html.erb
			format.xml { render :xml => @status }
		end
	end

	def edit
		@status = Status.find(params[:id])
	end

	def update
		@status =Status.find(params[:id])

		respond_to do |format|
			if @status.update_attributes(params[:status])
				format.html { redirect_to(@status, :notice => 'status was successfully updated')}
				format.xml { head :ok }
			else
				format.html { render :action => "edit"}
				format.xml { render :xml => status_errors, :status => :unprocessable_entity }
			end
		end
	end

	def create
		@status = Status.new(params[:status])
      
		respond_to do |format|
			if @status.save
				format.html {redirect_to(@status, :notice => 'status was successfully created')}
			else
				format.html (render :action => 'new')
				format.xml { render :xml => @status.errors, :status => :unprocessable_entity}
			end
		end
	end


	def show
		@status = Status.find(params[:id])
	end

	def delete
		@status = Status.find(params[:id])
		@status.destroy

		respond_to do |format|
			format.html {redirect_to(status_url)}
			format.xml { head :ok }
		end
	end

	def destroy
		@status = Status.find(params[:id])
		@status.destroy

		respond_to do |format|
			format.html {redirect_to(statuses_url)}
			format.xml { head :ok }
		end
	end
end
