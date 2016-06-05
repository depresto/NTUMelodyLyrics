class BorrowListsController < ApplicationController
  before_action :set_borrow_list, only: [:show, :edit, :update, :destroy]

  # GET /borrow_lists
  # GET /borrow_lists.json
  def index
    @borrow_lists = BorrowList.all
  end

  # GET /borrow_lists/1
  # GET /borrow_lists/1.json
  def show
  end

  # GET /borrow_lists/new
  def new
    @borrow_list = BorrowList.new
  end

  # GET /borrow_lists/1/edit
  def edit
  end

  # POST /borrow_lists
  # POST /borrow_lists.json
  def create
    @borrow_list = BorrowList.new(borrow_list_params)

    respond_to do |format|
      if @borrow_list.save
        format.html { redirect_to @borrow_list, notice: 'Borrow list was successfully created.' }
        format.json { render :show, status: :created, location: @borrow_list }
      else
        format.html { render :new }
        format.json { render json: @borrow_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrow_lists/1
  # PATCH/PUT /borrow_lists/1.json
  def update
    respond_to do |format|
      if @borrow_list.update(borrow_list_params)
        format.html { redirect_to @borrow_list, notice: 'Borrow list was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrow_list }
      else
        format.html { render :edit }
        format.json { render json: @borrow_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrow_lists/1
  # DELETE /borrow_lists/1.json
  def destroy
    @borrow_list.destroy
    respond_to do |format|
      format.html { redirect_to borrow_lists_url, notice: 'Borrow list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow_list
      @borrow_list = BorrowList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrow_list_params
      params.fetch(:borrow_list, {})
    end
end
