class OrdersController < ApplicationController

	def index
		@orders = Order.order("created_at DESC")
	end  

	def new
		@order = Order.new

		if signed_in? 	
			respond_to do |format|
			format.html # index.html.erb
			format.xml { render :xml => @order }
			end
		else
			redirect_to signin_path
		end	
			
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])

		respond_to do |format|
			if @order.update_attributes(params[:order])
				format.html { redirect_to(@order, :notice => 'order was successfully updated')}
				format.xml { head :ok }
			else
				format.html { render :action => "edit"}
				format.xml { render :xml => order_errors, :status => :unprocessable_entity }
			end
		end
	end

	def create
		@order = Order.new(params[:order])
		@order.user = current_user
      
		respond_to do |format|
			if @order.save
				format.html {redirect_to(@order, :notice => 'order was successfully created')}
			else
				format.html (render :action => 'new')
				format.xml { render :xml => @order.errors, :status => :unprocessable_entity}
			end
		end
	end


	def show
		@order = Order.find(params[:id])
	end

	def delete
		@order = Order.find(params[:id])
		@order.destroy

		respond_to do |format|
			format.html {redirect_to(order_url)}
			format.xml { head :ok }
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy

		respond_to do |format|
			format.html {redirect_to(orders_url)}
			format.xml { head :ok }
		end
	end
end

