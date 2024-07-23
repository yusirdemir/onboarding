# views/company_onboarding_steps/current_step.json.jbuilder

json.status @status

json.company_onboarding do
  json.partial! "company_onboarding_steps/company_onboarding_step", company_onboarding_step: @current_onboarding_step
end

json.current_onboarding do
  json.partial! "onboarding_steps/onboarding_step", onboarding_step: @current_onboarding_step.onboarding_step
end

json.next_onboarding do
  json.partial! "onboarding_steps/onboarding_step", onboarding_step: @next_onboarding_step
end
