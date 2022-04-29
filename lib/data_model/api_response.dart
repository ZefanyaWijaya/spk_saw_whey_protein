abstract class ApiResponse {
  final String message;

  ApiResponse({required this.message});
}

/// Data model for Successful Response from API Request
class SuccessResponse extends ApiResponse {
  SuccessResponse({required String message}) : super(message: message);

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return SuccessResponse(message: json['message']);
  }
}

/// Data model for Failed Response from API Request
class FailedResponse extends ApiResponse {
  final String errorKey;
  final String? errorMessage;
 
  FailedResponse({
    required this.errorKey,
    this.errorMessage,
    required String message
  }): super (message: message);

  factory FailedResponse.fromJson(Map<String, dynamic> json) {
    return FailedResponse(
      message: json['message'],
      errorKey: json['error_key'],
      errorMessage: json['error_message'],
    );
  }
}
