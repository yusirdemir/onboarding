class SyncProgressService
  def initialize(company_id)
    @company_id = company_id
  end

  def progress
    progress_data = {
      warehouses: fetch_warehouses_progress,
      products: fetch_products_progress,
      vendors: fetch_vendors_progress,
      saleshistory: fetch_saleshistory_progress
    }

    {
      company_id: @company_id,
      warehouses: progress_data[:warehouses],
      products: progress_data[:products],
      vendors: progress_data[:vendors],
      saleshistory: progress_data[:saleshistory],
      total_completion_percentage: calculate_total_completion_percentage(progress_data)
    }
  end

  private

  def fetch_warehouses_progress
    # WarehouseFetcher.new(@company_id).progress
    {
      total: 10,
      fetched: 2,
      completion_percentage: calculate_percentage(2, 10)
    }
  end

  def fetch_products_progress
    # ProductFetcher.new(@company_id).progress
    {
      total: 500,
      fetched: 500,
      completion_percentage: calculate_percentage(500, 500)
    }
  end

  def fetch_vendors_progress
    # VendorFetcher.new(@company_id).progress
    {
      total: 500,
      fetched: 45,
      completion_percentage: calculate_percentage(50, 500)
    }
  end

  def fetch_saleshistory_progress
    # SalesHistoryFetcher.new(@company_id).progress
    {
      total: 500,
      fetched: 45,
      completion_percentage: calculate_percentage(50, 500)
    }
  end

  def calculate_percentage(fetched, total)
    return 0 if total.zero?
    ((fetched.to_f / total) * 100).round
  end

  def calculate_total_completion_percentage(progress_data)
    percentages = [
      progress_data[:warehouses][:completion_percentage],
      progress_data[:products][:completion_percentage],
      progress_data[:vendors][:completion_percentage],
      progress_data[:saleshistory][:completion_percentage]
    ]

    total_percentage = percentages.sum / percentages.size
    total_percentage.round
  end
end
