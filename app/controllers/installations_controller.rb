class InstallationsController < ApplicationController

  def index
    @installations = Installation.all
  end  

  def new
    @installation = Installation.new
      respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @installation }
    end
  end

  def edit
    @installation = Installation.find(params[:id])
  end

    def update
    @installation = Installation.find(params[:id])

    respond_to do |format|
      if @installation.update_attributes(params[:installation])
        format.html { redirect_to(@installation, :notice => 'installation was successfully updated')}
        format.xml { head :ok }
      else
        format.html { render :action => "edit"}
        format.xml { render :xml => installation_errors, :status => :unprocessable_entity }
      end
    end
end

  def create
    @installation = Installation.new(params[:installation])
      
      respond_to do |format|
       if @installation.save
       format.html {redirect_to(@installation, :notice => 'Installation was successfully created')}
       format.xml { render :xml => @installation, :status => :created, :installation => @installation}
       else
       format.html (render :action => 'new')
       format.xml { render :xml => @installation.errors, :status => :unprocessable_entity}
       end
      end
  end


  def show
    @installation = Installation.find(params[:id])

  end

  def delete
    @installation = Installation.find(params[:id])
    @installation.destroy

    respond_to do |format|
      format.html {redirect_to(installation_url)}
      format.xml { head :ok }
    end
  end

  def destroy
    @installation = Installation.find(params[:id])
    @installation.destroy

    respond_to do |format|
      format.html {redirect_to(installations_url)}
      format.xml { head :ok }
    end
  end

end

