class CollectionsController < ApplicationController
  load_and_authorize_resource

  before_filter :set_filter_options

  def set_filter_options
    # session[:filters] ||= HashWithIndifferentAccess.new(@@defaults)
    #
    # @@defaults.each do |key, value|
    #   session[:filters][key] ||= value
    # end
    #
    # session[:filters][:page] = nil
    # session[:filters] = session[:filters].merge params.slice(:page, :per_page)
  end

  def set_filters
    session[:filters] = session[:filters].merge params.slice(:search, :collections, :description)

    session[:filters][:collections] = []
    if params[:collections]
      params[:collections].each do |key, value|
        session[:filters][:collections] << Integer(key) if value == "1"
      end
    end
    if session[:filters][:collections].include?(0)
      session[:filters][:collections] = []
    end

    session[:filters][:description] = []
    if params[:description]
      params[:description].each do |key, value|
        session[:filters][:description] << Integer(key) if value == "1"
      end
    end
    if session[:filters][:description].include?(0)
      session[:filters][:description] = []
    end

    redirect_to :back
  end


  def new
    @collection = Collection.new
  end

  def index
    # Show all public collections
    @heading = 'Public collections'
    @instructor = Instructor.find_by_id(@current_user)
    @collections = Collection.public
  end

  def search
    # debugger

    @search = params[:search]

    if @search == ""
      redirect_to collections_path and return
    end

    @collection_by_name = Collection.where(:name => @search, :is_public => true) + @current_user.collections.where(:name => @search)
    @collection_by_description = Collection.where(:description => @search, :is_public => true) + @current_user.collections.where(:description => @search)

    if @collection_by_name.nil? && @collection_by_description.nil?
      flash[:notice] = "Can't find collection \"#{@search}\""
      redirect_to collections_path
    end

    if @collection_by_name.nil?
      @collections = @collection_by_description.uniq! 
    else
      @collections = @collection_by_name.uniq! 
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    @problems = @collection.problems
  end

  # creates a new collection with user specified values and sets as current collection
  def create
    collection = @current_user.collections.create
    collection.set_attributes(params)

    if not collection.valid?
      collection_errors(collection)
      redirect_to :back and return
    else
      collection.save
    end
    redirect_to collection_path(:id => collection.id)
  end

  def show
    @collection = Collection.find(params[:id])
    @problems = @collection.problems
  end

  def update
    collection = Collection.find(params[:id])
    collection.set_attributes(params)

    if not collection.valid?
      collection_errors(collection)
      redirect_to :back and return
    else
      collection.save
      # if params[:is_public] != nil
      #   collection.problems.each{ |prob| prob.is_public = collection.is_public ; prob.save }
      # end
    end
    redirect_to collection_path(:id => collection.id)
  end

  def destroy
    Collection.find(params[:id]).destroy
    flash[:notice] = 'Collection deleted'
    redirect_to profile_path
  end

  # def add_problems
  #   collection = Collection.find(params[:id])
  #   problem_ids = self.class.parse_list params[:problem_ids]
  #   problems = problem_ids.map{|id| Problem.find_by_id(id)}.reject{|p| p.nil?}
  #   problems.each {|p| collection.problems << p if !collection.problems.include?(p)}
  #   flash[:notice] = "Problems added"
  #   redirect_to :back
  # end

  # def remove_problems
  #   collection = Collection.find(params[:id])
  #   problem_ids = self.class.parse_list params[:problem_ids]
  #   problems = problem_ids.map{|id| Problem.find_by_id(id)}.reject{|p| p.nil?}
  #   problems.each {|p| collection.problems.delete(p) if collection.problems.include?(p)}
  #   flash[:notice] = "Problems removed"
  #   redirect_to :back
  # end

  def export
    @collection = Collection.find(params[:id])

    @ruql_code = @collection.export('ruql') rescue "(error rendering RuQL)"
    @html_code = @collection.export('Html5') rescue "(error rendering HTML)"
    @edx_code = @collection.export('EdXml') rescue "(error rendering Edml)"
    @autoqcm_code = @collection.export('AutoQCM') rescue "(error rendering AutoQCM)"

    if not @html_code
      flash[:notice] = 'Cannot export an empty collection! Add some questions to your collection first!'
      redirect_to collection_path(:id => @collection.id)
    end
  end

  def preview
    html_code = Collection.find(params[:id]).export('Html5')
    render :text => html_code
  end

  def finalize_upload
    @collections = params[:ids].map{|collection_id| Collection.find(collection_id)}
    @collections.each{|c| authorize! :read, c}
  end

  private

  def collection_errors(collection)
    flash[:notice] =  collection.errors.messages.map {|key, value| key.to_s + ' ' + value.to_s}.join ' ,'
  end

end
