class ComputersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_computer, only: %i[show edit update destroy]

    def index
      # Tìm kiếm với Ransack
      @q = Computer.ransack(params[:q])
      @computers = @q.result.page(params[:page]) # Phân trang với Kaminari
    end

    def show
    end

    def new
      @computer = Computer.new
    end

    def create
      @computer = Computer.new(computer_params)
      if @computer.save
        redirect_to computers_path, notice: "Computer was successfully created."
      else
        render :new
      end
    end

    def edit; end

    def update
      if @computer.update(computer_params)
        redirect_to computers_path, notice: "Computer was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @computer.destroy
      redirect_to computers_path, notice: "Computer was successfully deleted."
    end

    private

    def set_computer
      @computer = Computer.find(params[:id])
    end

    def computer_params
      params.require(:computer).permit(:name, :brand, :description, :price)
    end
end