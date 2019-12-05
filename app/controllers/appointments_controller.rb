class AppointmentsController < ApplicationController
  before_action :set_user
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy ]

  def index 
    @appointments = @user.appointments.all
  end

  def new
    @doctors = Doctor.all
    @appointment = @user.appointments.new 
  end

  def create
    @appointment = @user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @doctors = Doctor.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to user_path(@user)
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time, :doctor_id, :appointment_type)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_appointment
      @appointment = @user.appointments.find(params[:id])
    end
end
