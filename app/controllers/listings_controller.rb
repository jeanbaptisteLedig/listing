class ListingsController < ApplicationController

  def index
    @listings = Listing.search(params)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    redirect_to new_user_session_path unless current_user
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(task_params)

      respond_to do |format|
        if @listing.save
          format.html { redirect_to @listing, notice: 'Task was successfully created.' }
          format.json { render :show, status: :created, location: @listing }
        else
          format.html { render :new }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
  end

  def contact
    Contact.generate(params,current_user)
    render nothing:true
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:listing).permit(:title, :description, :picture,:category_id, :price).merge(user_id: current_user.id)
    end

end
