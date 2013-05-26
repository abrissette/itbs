class Admin::TypesController < ApplicationController
  # GET /admin/types
  # GET /admin/types.json
  def index
    @types = Type.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @types }
    end
  end

  # GET /admin/types/1
  # GET /admin/types/1.json
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end

  # GET /admin/types/new
  # GET /admin/types/new.json
  def new
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # GET /admin/types/1/edit
  def edit
    @type = Type.find(params[:id])
  end

  # POST /admin/types
  # POST /admin/types.json
  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to admin_type_path(@type), notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/types/1
  # PUT /admin/types/1.json
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to admin_type_path(@type), notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to admin_types_url }
      format.json { head :no_content }
    end
  end
end
