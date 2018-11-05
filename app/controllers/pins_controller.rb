class PinsController < ApplicationController
  
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:index, :show]  
  
  # GET /pins
  # GET /pins.json

  #def require_login
  #  unless user_signed_in?
  #  redirect_to new_user_session_path
  #  end
  #end

  def index
    @pins = Pin.all
  end
  
  def mypins
    @pins = current_user.pins
  end

  def pinsof
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @pins = @user.pins
  end

  # GET /pins/1
  # GET /pins/1.json
  def show

  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:name, :photo, :description)
    end
end
