class NovelasController < ApplicationController
  before_action :set_novela, only: %i[ show edit update destroy ]

  # GET /novelas or /novelas.json
  def index
    @novelas = Novela.all
    @novelas = @novelas.joins(:season).where(:season =>
       {:id => params[:season_id]}) if params[:season_id]
    		@novelas = @novelas.where(["name LIKE :filter", :filter => 
          ("%" + params[:filter] + "%")]) unless params[:filter].blank?  end

  # GET /novelas/1 or /novelas/1.json
  def show
  end

  # GET /novelas/new
  def new
    @novela = Novela.new
  end

  # GET /novelas/1/edit
  def edit
  end

  # POST /novelas or /novelas.json
  def create
    @novela = Novela.new(novela_params)

    respond_to do |format|
      if @novela.save
        format.html { redirect_to @novela, notice: "Novela was successfully created." }
        format.json { render :show, status: :created, location: @novela }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @novela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /novelas/1 or /novelas/1.json
  def update
    respond_to do |format|
      if @novela.update(novela_params)
        format.html { redirect_to @novela, notice: "Novela was successfully updated." }
        format.json { render :show, status: :ok, location: @novela }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @novela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /novelas/1 or /novelas/1.json
  def destroy
    @novela.destroy
    respond_to do |format|
      format.html { redirect_to novelas_url, notice: "Novela was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novela
      @novela = Novela.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def novela_params
      params.require(:novela).permit(:name, :description, :genre_id)
    end
end
