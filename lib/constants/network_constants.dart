class NetworkConstants {
  static const BASE_URL = "https://pmk-alert.sdnkotakulon3bondowoso.sch.id/";
  static const CLASSIFICATION_BASE_URL =
      "https://627d-112-78-133-106.ngrok-free.app/";

  // Auth
  static const REGISTER_URL = BASE_URL + "api/register";
  static const LOGIN_URL = BASE_URL + "api/login";
  static const OTP_URL = BASE_URL + "api/register/activate";
  static const EDIT_PROFILE = BASE_URL + "api/user/update-profile";
  static const CHANGE_PASSWORD = BASE_URL + "api/reset-password";
  static const SEND_OTP_CHANGE_PASSWORD = BASE_URL + "api/forgot-password";

  // Record
  static const UPLOAD_IMAGE_HEALTH_RECORD = BASE_URL + "api/upload-image-health-record";
  static const RECORD_HISTORY_URL = BASE_URL + "api/history-health-cow";

  // Classification
  static const CLASSIFICATION_URL = CLASSIFICATION_BASE_URL + "classification/";

  static const UNVERIFIED_ACCOUNT_MESSAGE = "Email belum diverifikasi";
}
