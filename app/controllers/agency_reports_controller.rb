class AgencyReportsController < ApplicationController

  def index
    @agency = current_user.agency
    @agency_reports = @agency.agency_reports.all

    @complete_reports = @agency_reports.find_all {|agency_report| agency_report.completed}

    @incomplete_reports = @agency_reports.find_all {|agency_report| agency_report.completed == false}
  end

end
