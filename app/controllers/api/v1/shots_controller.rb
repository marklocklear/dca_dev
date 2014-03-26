module Api
	module V1
		class ShotsController < ApplicationController
			before_filter :restrict_access

			def index
				@shots = Shot.all

				respond_to do |format|
					format.html # index.html.erb
					format.json { render json: @shots, :methods => [:avatar_url] }
				end
			end

			# GET /shots/1
			# GET /shots/1.json
			def show
				@shot = Shot.find(params[:id])

				respond_to do |format|
					format.html # show.html.erb
					format.json { render json: @shot }
				end
			end

			# GET /shots/new
			# GET /shots/new.json
			def new
				@shot = Shot.new

				respond_to do |format|
					format.html # new.html.erb
					format.json { render json: @shot }
				end
			end

			# GET /shots/1/edit
			def edit
				@shot = Shot.find(params[:id])
			end

			# POST /shots
			# POST /shots.json
			def create
				@shot = Shot.new(params[:shot])
				@shot.comedian_id = params[:shot][:comedian_id]

				respond_to do |format|
					if @shot.save
						format.html { redirect_to shots_path, notice: 'Shot was successfully created.' }
						format.json { render json: @shot, status: :created, location: @shot }
					else
						format.html { render action: "new" }
						format.json { render json: @shot.errors, status: :unprocessable_entity }
					end
				end
			end

			# PUT /shots/1
			# PUT /shots/1.json
			def update
				@shot = Shot.find(params[:id])

				respond_to do |format|
					if @shot.update_attributes(params[:shot])
						format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
						format.json { head :no_content }
					else
						format.html { render action: "edit" }
						format.json { render json: @shot.errors, status: :unprocessable_entity }
					end
				end
			end

			# DELETE /shots/1
			# DELETE /shots/1.json
			def destroy
				@shot = Shot.find(params[:id])
				@shot.destroy

				respond_to do |format|
					format.html { redirect_to shots_url }
					format.json { head :no_content }
				end
			end

			private
			def restrict_access
				api_key = User.find_by_api_key(params[:api_key])
				head :unauthorized unless api_key
			end
		end
	end
end
