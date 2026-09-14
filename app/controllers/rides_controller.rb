class RidesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ride, only: :show
  before_action :set_owned_ride, only: %i[ edit update destroy ]
  # GET /rides or /rides.json
  def index
    @allRides = Ride.includes(:user)
    @rides = @allRides.where(:end => false)
    if params[:departure].present?
      @rides = @rides.where(departure: params[:departure])
    end
  
    if params[:arrival].present?
      @rides = @rides.where(arrival: params[:arrival])
    end

    if params[:start_date].present?
      begin
        selected_date = Date.iso8601(params[:start_date])
        @rides = @rides.where(:reservation=> selected_date.beginning_of_day..selected_date.end_of_day)
      rescue ArgumentError
        @rides = @rides.none
      end
    end
  
    if params[:samesex].present?
      @rides = @rides.where(samesex: params[:samesex])
    end
  end

  # GET /rides/1 or /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides or /rides.json
  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    @ride.left = @ride.min
    @ride.end = false
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: "Ride was successfully created." }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1 or /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: "Ride was successfully updated." }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1 or /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: "Ride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.includes(comments: :user).find(params[:id])
    end

    def set_owned_ride
      @ride = current_user.rides.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ride_params
      params.require(:ride).permit(:departure, :arrival, :reservation, :min, :memo, :via, :samesex, :left, :end)
    end
end
