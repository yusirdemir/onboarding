class RefreshCalculationsWorker
  include Sidekiq::Worker

  def perform(company_id)
    puts "Refreshing calculations for company ##{company_id}"
  end
end
