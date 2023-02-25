class ReportsController < ApplicationController
 
  def index
  end

  def report_by_category

    @data = Operation.data_for_reports(params[:start_date], params[:end_date], params[:otype])
           .group("category_id").sum(:amount)

    @total = Operation.data_for_reports(params[:start_date], params[:end_date], params[:otype])
            .sum(:amount)

  #Preparing data for Chart.js
    pai_data = @data.transform_keys { |categ| Category.find_by(id: categ).name }.to_a
    
    @pai_name = pai_data.map { |e| e[0] }
    @pai_sum = pai_data.map { |e| e[1] }
  end

  
  def report_by_dates

    data_chart = Operation.data_for_reports(params[:start_date], params[:end_date], params[:otype])
                .group("strftime('%Y-%m-%d', odate)").sum(:amount).to_a

    @data_date = data_chart.map { |e| e[0] }
    @data_sum = data_chart.map { |e| e[1] }
  end

end
