Eater::App.controllers :crawled_sites do

  get :index do
    @title = "Sites"
    @crawled_sites = CrawledSite.all
    render 'crawled_sites/index'
  end

  get :new do
    @title = "Add sites"
    @crawled_site = CrawledSite.new
    render 'crawled_sites/new'
  end

  post :create do
    @crawled_site = CrawledSite.new(params[:crawled_site])
    if @crawled_site.save
      flash[:success] = "site created"
      redirect(url(:crawled_sites, :index))
    else
      flash.now[:error] = "error creating site"
      render 'crawled_sites/new'
    end

  end

  get :edit, :with =>:id do
    @crawled_site = CrawledSite.find(params[:id])
    if @crawled_site
      render 'crawled_sites/edit'
    else
      halt 404
    end
  end

  patch :update, :with =>:id do
    @crawled_site = CrawledSite.find(params[:id])
    if @crawled_site
      if @crawled_site.update_attributes(params[:crawled_site])
        params[:save_and_continue] ?
        redirect(url(:crawled_sites, :index)) :
          redirect(url(:crawled_sites, :edit, :id => @crawled_site.id))
      else
        render 'crawled_sites/edit'
      end
    else
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Crawled_Sites"
    crawled_site = CrawledSite.find(params[:id])
    if crawled_site
      if crawled_site.destroy
        flash[:success] = "delete_success"
      else
        ""
      end
      redirect url(:crawled_sites, :index)
    else
      halt 404
    end

  end

end
