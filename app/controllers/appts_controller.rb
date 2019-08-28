class ApptsController < ApplicationController
  before_action :set_appt
  
  def index
    @doctor = @doctor.appts.where(role: 'Doctor')
    @pas = @doctor.appts.where(role: 'pa')
    @user = @doctor.appts.where(role: 'Patient')
  end

  def show
  end

  def new
    @appt = @doctor.appts.new
  end

  def create
    @appt = @doctor.appts.new(appt_params)
    if @appt.save
      redirect_to doctor_appts_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @appt = @doctor.appt.find(params[:id])
    @appt.destroy
    redirect_to doctor_appts_path(@doctor)
  end

  private

   def set_appt
     @appt = Appt.find(params[:appt_id]) 
   end

   def appt_params
     params.require(:appt).permit(:role, :user_id)
   end
end
