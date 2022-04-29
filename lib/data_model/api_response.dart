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
class FailedResponse {
  final String errorKey;
  final String? errorMessage;
 
  FailedResponse({
    required this.errorKey,
    this.errorMessage,
  
  });

  factory FailedResponse.fromJson(Map<String, dynamic> json) {
    return FailedResponse(
      errorKey: json['error_key'],
      errorMessage: json['error_message'],
    );
  }
}
