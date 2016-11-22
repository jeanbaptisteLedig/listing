class PagesController < ApplicationController

  def index
    @pages = Page.search(params)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    redirect_to new_user_session_path unless current_user
    @page = Page.new
  end

  def create
    @page = Page.create(task_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to @page, notice: 'Task was successfully created.' }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :new }
          format.json { render json: @page.errors, status: :unprocessable_entity }
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
      params.require(:page).permit(:title, :content, :language).merge(user_id: current_user.id)
    end

end
