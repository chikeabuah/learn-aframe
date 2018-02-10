class AframesController < ApplicationController
  before_action :set_aframe, only: [:show, :edit, :update, :destroy]

  before_action :set_vars

  def set_vars
    @namespace = { action: params[:action], controller: params[:controller], id: params[:id] }
  end

  def random
    progs = Dir["#{Rails.root}/lib/demojs/*.js"]
    prog = progs[rand(progs.length)]
    f = File.read(prog)
    respond_to do |format|
      format.json { render json: {prog: f} }
    end
  end

  # GET /aframes
  # GET /aframes.json
  def index
    @aframes = Aframe.all
  end

  # GET /aframes/1
  # GET /aframes/1.json
  def show
  end

  # GET /aframes/new
  def new
    @aframe = Aframe.new
  end

  # GET /aframes/1/edit
  def edit
  end

  # POST /aframes
  # POST /aframes.json
  def create
    @aframe = Aframe.new(aframe_params)

    respond_to do |format|
      if @aframe.save
        format.html { redirect_to @aframe, notice: 'Aframe was successfully created.' }
        format.json { render :show, status: :created, location: @aframe }
      else
        format.html { render :new }
        format.json { render json: @aframe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aframes/1
  # PATCH/PUT /aframes/1.json
  def update
    respond_to do |format|
      if @aframe.update(aframe_params)
        format.html { redirect_to @aframe, notice: 'Aframe was successfully updated.' }
        format.json { render :show, status: :ok, location: @aframe }
      else
        format.html { render :edit }
        format.json { render json: @aframe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aframes/1
  # DELETE /aframes/1.json
  def destroy
    @aframe.destroy
    respond_to do |format|
      format.html { redirect_to aframes_url, notice: 'Aframe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aframe
      @aframe = Aframe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aframe_params
      params.require(:aframe).permit(:jscode, :htmlcode)
    end
end
