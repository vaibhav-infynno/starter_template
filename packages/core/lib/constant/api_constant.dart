import '../env/env.dart';

class ApiConstants {
  static const String appStagingBaseUrl = Env.baseUrl;
  // static const String appStagingBaseUrl = "http://localhost:3000/api/";
  // vendor

  static const String registerVendor = "vendors/register";
  static const String loginVendor = "vendors/login";
  static const String updateBusinessDetail = "vendors/update-business";
  static const String confirmImageUpload = "vendors/confirm-image-upload";
  static const String selectServices = "vendors/select-services";
  static const String updateVendor = "vendors/update";
  static const String changePassword = "vendors/change-password";
  static const String deleteVendor = "vendors/delete/:id";
  static const String forgotPassword = "vendors/forgot-password";
  static const String resetPassword = "vendors/reset-password";
  static const String resendOtp = "vendors/resend-otp";
  static const String verifyOtp = "vendors/verify-otp";
  static const String getVendorProfile = "vendors/get-vendor-profile";
  static const String getImageUrl = "get-image-url";
  static const String getServices = "services/";
  static const String updateServices = "services/update-services";
  static const String deleteServices = "services/delete-services";
  static const String addServices = "vendors/add-service";
  static const String vendorCustomServices = "services/get-vendor-routes";
  static const String verifyRegistrationOtp = "vendors/verify-otp-registration";
  static const String validateToken = "vendors/validate-token";

  // customers
  static const String addCustomer = "customers/add-customer";
  static const String addCustomerWork = "customers/add-work";
  static const String updateCustomer = "customers/update-customers";
  static const String deleteCustomer = "customers/delete-customers";
  static const String getAllCustomer = "customers/get-all-customers";
  static const String getOneCustomer = "customers/get-one-customers/";
  static const String customerServiceHistory = "customers/customers/";
  static const String customerSearch = "customers/search";
  static const String updateCustomerWorkById = "customers/update-customer-work";
  static const String uploadSignatureUrl = "vendors/upload-signature";
  static const String getSignatureUrl = "get-signature-url";
  static const String generateInvoice = "customers/generate-invoice";
  static const String getCustomerDataForInvoice =
      "customers/customer-invoice-data/";
  static const String addPayment = "customers/add-payment";

  // work
  static const String getCustomers = "work/all-customer";
  static const String getAllWork = "work/";
  static const String getOneWork = "work/";
  static const String addWork = "work/";
  static const String updateWork = "work/update-work";
  static const String markAsCompeted = "work/mark-as-completed-work";
  static const String deleteWork = "work/delete-work";
  static const String getWorkCounts = "work/get-work-count/get";
  static const String updateDatePriceCollected =
      "work/update-date-price-collected";
  static const String updateNotes = "work/update-notes";
  static const String deleteAmcSchedule = "work/delete-amc-schedule";
  static const String getAmcSchedules = "work/get-all-amc-schedules/amc";

  // dashboard
  static const String getDashboardCounts = "dashboard-stats";

  //reports
  static const String getReports = "reports/weekly-stats";

  // product
  static const String createProduct = "products/create-product";
  static const String updateProduct = "products/update-product";
  static const String getAllProducts = "products/get-all-products";
  static const String getOneProduct = "products/get-one-product/";
  static const String deleteProduct = "products/delete-product";
  static const String deleteAdditionalImage =
      "products/additional-image-delete";
  static const String toggleActiveProduct = "products";
}
