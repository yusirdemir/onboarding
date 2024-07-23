json.success true
json.progress do
  json.company_id @company_id
  json.total_completion_percentage @progress[:total_completion_percentage]
  json.warehouses @progress[:warehouses]
  json.products @progress[:products]
  json.vendors @progress[:vendors]
  json.saleshistory @progress[:saleshistory]
end