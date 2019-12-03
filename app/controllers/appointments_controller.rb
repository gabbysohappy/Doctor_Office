class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy ]

  def index 
    @appointments = @doctor.appointments.all
  end

  def new
    @appointment = @doctor.appointments.new 
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :user_id, :time)
    end

    def set_doctor
      @doctor = doctor.find(params[:doctor_id])
    end

    def set_appointment
      @appointment = @doctor.appointments.find(params[:id])
    end
end
