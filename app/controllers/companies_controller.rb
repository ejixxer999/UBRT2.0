class CompaniesController < ApplicationController


    def index
        @companies = Company.all
    end 


    def new 
        @company = Company.new
    end 

    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to companies_path
        else
            render :new
        end
    end 

    def show
        @company = Company.find_by_id(params[:id])
    end 

    

    

    private
    def company_params
        params.require(:company).permit(:name, :location, :num_of_workers)
    end 

end
