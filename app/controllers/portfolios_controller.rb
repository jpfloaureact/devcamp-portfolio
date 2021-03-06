class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end
   
  def new 
    @portfolio_items = Portfolio.new
    3.times { @portfolio_items.technologies.build }
  end

  def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title,
                                                                       :subtitle,
                                                                       :body, 
                                                                       technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
end

def update
  @portfolio_items = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'record was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_items }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @portfolio_items = Portfolio.find(params[:id])
end

def destroy
  #perform look-up
  @portfolio_items = Portfolio.find(params[:id])
  #destroy record
  @portfolio_items.destroy
  #redirect
  respond_to do |format|
    format.html { redirect_to portfolios_url, notice: 'portfolio was successfully destroyed.' }
  end
end

end
