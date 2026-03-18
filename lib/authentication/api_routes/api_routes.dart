class ApiRoutes {
  // Base URL
  static const String BASE_URL = "http://192.168.1.40/wordpress/";
  // LOGIN
  static const String LOGIN = "${BASE_URL}/wp-json/jwt-auth/v1/token";
  static const String livecalsses = "${BASE_URL}/wp-json/sm/student/live-classes";
  static const String Homeworks = "${BASE_URL}/wp-json/sm/student/homework?homework_page=1&homework_per_page=10";
// Holiday
  static const String uppaidfees = "${BASE_URL}/wp-json/sm/student/fee-invoices";
  //Task
  static const String paymenthistory = "${BASE_URL}/wp-json/sm/student/submit-invoice-payment-request";
  static String taskView(String id) {
    return "${BASE_URL}/wp-json/hr/user/user_tasks/$id/edit";
  }
  static const String noticeboard = "${BASE_URL}/wp-json/sm/student/noticeboard?notices_page=1&notices_per_page=50";
//Notice
  static const String classtimetable = "${BASE_URL}/wp-json/sm/student/class-time-table";
  //Event
  static const String overall_result = "${BASE_URL}/wp-json/sm/student/overall-result";
//Project
  static const String attendence = "${BASE_URL}/wp-json/sm/student/attendance";
  static String projectView(String id) {
    return "${BASE_URL}/wp-json/hr/user/user_project/${id}/edit";
  }
//Leave   wp-json/hr/user/user_project/3/edit
  static const String leaverequest = "${BASE_URL}/wp-json/sm/student/leave-requests?leaves_page=1&leaves_per_page=10";
  static const String studymaterial = "${BASE_URL}/wp-json/sm/student/study-materials/2";
  static const String studentevents = "${BASE_URL}/wp-json/sm/student/events?events_page=1&events_per_page=10";
  static const String editLeave = "${BASE_URL}/wp-json/hr/user/leaves-update/";

  static const String DASHBOARD = "${BASE_URL}/wp-json/sm/student/dashboard";
//Salary Slip
  static String salarySlip() {
    return "${BASE_URL}/wp-json/hr/user/salarySlip";
  }
  //Profile
  static const String profile = "${BASE_URL}/wp-json/hr/user/staff-profile";

  static const String profileUpdate = "${BASE_URL}/wp-json/hr/user/staff-profile/update";

  //report
  static const String REPORTS = "${BASE_URL}/wp-json/hr/user/month-data";
}
