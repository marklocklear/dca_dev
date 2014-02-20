class ComediansController < ApplicationController
  # GET /comedians
  # GET /comedians.json
  def index
    @comedians = Comedian.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comedians }
    end
  end

  # GET /comedians/1
  # GET /comedians/1.json
  def show
    @comedian = Comedian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comedian }
    end
  end

  # GET /comedians/new
  # GET /comedians/new.json
  def new
    @comedian = Comedian.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comedian }
    end
  end

  # GET /comedians/1/edit
  def edit
    @comedian = Comedian.find(params[:id])
  end

  # POST /comedians
  # POST /comedians.json
  def create
    @comedian = Comedian.new(params[:comedian])

    respond_to do |format|
      if @comedian.save
        format.html { redirect_to @comedian, notice: 'Comedian was successfully created.' }
        format.json { render json: @comedian, status: :created, location: @comedian }
      else
        format.html { render action: "new" }
        format.json { render json: @comedian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comedians/1
  # PUT /comedians/1.json
  def update
    @comedian = Comedian.find(params[:id])

    respond_to do |format|
      if @comedian.update_attributes(params[:comedian])
        format.html { redirect_to @comedian, notice: 'Comedian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comedian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comedians/1
  # DELETE /comedians/1.json
  def destroy
    @comedian = Comedian.find(params[:id])
    @comedian.destroy

    respond_to do |format|
      format.html { redirect_to comedians_url }
      format.json { head :no_content }
    end
  end
end
