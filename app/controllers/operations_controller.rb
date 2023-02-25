class OperationsController < ApplicationController
  before_action :get_category, except: %i[ display new create ]
  before_action :set_categories, only: %i[ new edit create update ]
  before_action :set_operation, only: %i[ show edit update destroy ]

  # GET /operations
  def display
    if (params[:search]).present?
      @operations = Operation.search(params[:search]).order(created_at: :desc).page(params[:page])
    else
      @operations = Operation.order(created_at: :desc).page(params[:page])
    end
  end

  # GET category/id/operations
  def index
    @operations = @category.operations.page(params[:page])
  end

  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)
    
    respond_to do |format|
      if @operation.save
        format.html { redirect_to operations_path(@category), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operations_path(@category), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_path(@category), notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  
  private
    def get_category
      @category = Category.find(params[:category_id])
    end  
    
    def set_categories
      @categories = Category.all.map{ |cat| [ cat.name, cat.id ] }
    end 
  
    def set_operation
      @operation = @category.operations.find(params[:id])
    end

    def operation_params
      params.require(:operation).permit(:amount, :otype, :odate, :description, :category_id)
    end
end
