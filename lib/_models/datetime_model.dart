class ApiResponse {
  bool success;
  int statusCode;
  DateAndTime data;

  ApiResponse({
    required this.success,
    required this.statusCode,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] as bool,
      statusCode: json['status_code'] as int,
      data: DateAndTime.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class DateAndTime {
  String date;
  String time;

  DateAndTime({
    required this.date,
    required this.time,
  });

  factory DateAndTime.fromJson(Map<String, dynamic> json) {
    return DateAndTime(
      date: json['date'] as String,
      time: json['time'] as String,
    );
  }
}
