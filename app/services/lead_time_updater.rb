class LeadTimeUpdater
  def initialize(company_id)
    @company_id = company_id
  end

  def perform
    puts "Updating lead time for company ##{@company_id}"
  end
end
