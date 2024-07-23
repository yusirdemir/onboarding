onboarding_step1 = OnboardingStep.create!(
  title: "Welcome to Fabrikator",
  description: "This is the first step of your journey to modern inventory planning! Bahadir & Demirhan, creators of Fabrikator, recorded a short video for you. Watch the video to learn what we've been up to!",
  order: 1,
  instructional_video_url: "url",
  instructional_video_info: "info",
  is_skippable: false,
  skippable_text: ""
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step1.id,
  input_type: "button",
  name: "Start onboarding",
  placeholder: "",
  info: "",
  image: ""
)

onboarding_step2 = OnboardingStep.create!(
  title: "Set your order lead time",
  description: "We rely on lead time information in order to calculate the optimal date for restocking a product. The restock date is calculated based on the lead times. Enter an average lead time to be used by default.",
  order: 2,
  instructional_video_url: "url",
  instructional_video_info: "Watch Lead Time Tutorial",
  is_skippable: false,
  skippable_text: ""
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step2.id,
  input_type: "text",
  name: "Set lead time",
  placeholder: "63 days",
  info: "You can update the lead time per supplier or product later.",
  image: ""
)

OnboardingStepAction.create!(
  onboarding_step_id: onboarding_step2.id,
  action_type: "service",
  action_class: "LeadTimeUpdater",
)

onboarding_step3 = OnboardingStep.create!(
  title: "Set days of stock for products",
  description: "Days of stock defines how many days you will be covering with your next purchase order. This also defines how often you will restock. Set a default value for all your SKUs, later on you can change this.",
  order: 3,
  instructional_video_url: "url",
  instructional_video_info: "Video info text appears here",
  is_skippable: false,
  skippable_text: ""
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step3.id,
  input_type: "text",
  name: "Set days of stock",
  placeholder: "63 days",
  info: "Later on, you can change this per SKU on the supply planning page.",
  image: ""
)

onboarding_step4 = OnboardingStep.create!(
  title: "Set forecasting days",
  description: "Forecasting days determines how far back in historical data our algorithm looks to calculate your product's daily average sales.",
  order: 4,
  instructional_video_url: "url",
  instructional_video_info: "Video info text appears here",
  is_skippable: false,
  skippable_text: ""
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step4.id,
  input_type: "text",
  name: "Set forecasting days",
  placeholder: "63 days",
  info: "As an example, setting it to 90 days means we'll use the last 90 days of sales for forecasting. This can be changed later.",
  image: ""
)

OnboardingStepAction.create!(
  onboarding_step_id: onboarding_step4.id,
  action_type: "worker",
  action_class: "RefreshCalculationsWorker",
)

onboarding_step5 = OnboardingStep.create!(
  title: "Upload existing POs",
  description: "We update our forecasting based on your incoming inventory. That is why it is critical to upload your open POs to Fabrikator.",
  order: 5,
  instructional_video_url: "url",
  instructional_video_info: "Video info text appears here",
  is_skippable: true,
  skippable_text: "I do not have existing PO"
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step5.id,
  input_type: "file",
  name: "",
  placeholder: "Upload Excel or CSV file",
  info: "",
  image: ""
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step5.id,
  dependency_type: "sync_products"
)

onboarding_step6 = OnboardingStep.create!(
  title: "Match suppliers and products",
  description: "We need to match your products with suppliers. How would you like to proceed?",
  order: 6,
  instructional_video_url: "url",
  instructional_video_info: "Video info text appears here",
  is_skippable: true,
  skippable_text: "I won't use vendors as supplier"
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step6.id,
  input_type: "text",
  name: "Copy vendors as suppliers",
  placeholder: "Vendor title + 48 will be added as a supplier",
  info: "",
  image: ""
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step6.id,
  dependency_type: "sync_products"
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step6.id,
  dependency_type: "sync_vendors"
)

onboarding_step7 = OnboardingStep.create!(
  title: "Set bundles",
  description: "You can accurately forecast and restock bundle components by defining your bundles on Fabrikator. To use this feature, you should already be using a bundles app that manages bundle inventory.",
  order: 7,
  instructional_video_url: "url",
  instructional_video_info: "Video info text appears here",
  is_skippable: true,
  skippable_text: "I don't have any bundles"
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step7.id,
  input_type: "file",
  name: "",
  placeholder: "Upload Bundle Excel or CSV",
  info: "",
  image: ""
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step7.id,
  dependency_type: "sync_products"
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step7.id,
  dependency_type: "sync_vendors"
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step7.id,
  dependency_type: "sync_warehouses"
)

OnboardingStepDependency.create!(
  onboarding_step_id: onboarding_step7.id,
  dependency_type: "sync_sales_histories"
)

onboarding_step8 = OnboardingStep.create!(
  title: "Set integrations",
  description: "We have a set of integrations to save you time by automating tasks and data sync. Click on your preferred integration or request a new integration.",
  order: 8,
  instructional_video_url: "",
  instructional_video_info: "",
  is_skippable: false,
  skippable_text: ""
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step8.id,
  input_type: "checkbox",
  name: "Shopify",
  placeholder: "",
  info: "",
  image: "shopify.jpg"
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step8.id,
  input_type: "checkbox",
  name: "Amazon",
  placeholder: "",
  info: "",
  image: "amazon.jpg"
)

OnboardingStepInput.create!(
  onboarding_step_id: onboarding_step8.id,
  input_type: "button",
  name: "Request new inegration",
  placeholder: "",
  info: "",
  image: ""
)

CompanyOnboardingStep.create!(
  company_id: 1,
  onboarding_step_id: onboarding_step1.id,
  data: nil,
  is_skipped: false
)

CompanyOnboardingStep.create!(
  company_id: 1,
  onboarding_step_id: onboarding_step2.id,
  data: { lead_time: 63 },
  is_skipped: false
)