class JobsitesController < ApplicationController

    def new
        if params[:company_id] && company = Company.find_by_id(params[:company_id])
            @jobsite = company.jobsites.build
        else
            @jobsite = Jobsite.new
            @jobsite.build_company
        end
        # @jobsite = Jobsite.new(user_id: params[:user_id])
        # @companies = Company.all
    end 

    def create
        @jobsite = current_user.jobsites.build(jobsite_params)
        if @jobsite.save
            redirect_to user_path(@jobsite.user)
        else
            @jobsite.build_company unless @jobsite.company
            render :new
        end
        # @jobsite = Jobsite.new(jobsite_params)
        # if @jobsite.save
        #     flash[:alert] = "Jobsite saved!"
        #     redirect_to user_path(@jobsite.user)
        # else
        #     render :new
        # end
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
        set_jobsite
        @jobsite.destroy
        redirect_to user_path
    end


    private

    def set_jobsite
        @jobsite = Jobsite.find_by(id: params[:id])
        if !@jobsite
            redirect_to user_path
        end
    end

    
    def jobsite_params
        params.require(:jobsite).permit(:name, :location, :user_id, :company_id, company_attributes: [:name, :location, :num_of_workers])
    end
end
