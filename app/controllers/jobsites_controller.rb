class JobsitesController < ApplicationController
    def new
        @jobsite = Jobsite.new(user_id: params[:user_id])
        @companies = Company.all
    end 

    def create
        @jobsite = Jobsite.new(jobsite_params)
        if @jobsite.save
            flash[:alert] = "Jobsite saved!"
            redirect_to user_path(@jobsite.user)
        else
            render :new
        end
    end 

    def index
        @jobsites = current_user.jobsites
    end 

    def show
        @jobsite = Jobsite.find_by_id(params[:id])

    end 

    def edit
        if current_user 
            @jobsite = current_user.jobsites.find_by_id(params[:id])
            

        end

    end 
    
    def update
        @jobsite = Jobsite.find_by_id(params[:id])
        @jobsite.update(jobsite_params)
        if @jobsite.save
            redirect_to user_jobsites_path(@jobsite.user)
        else
            render :edit
        end

    end 

    def destroy
    end


    private
    def jobsite_params
        params.require(:jobsite).permit(:name, :location, :user_id, :company_id)
    end
end
