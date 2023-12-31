class ApiResponse {
  final int? statusCode;
  final bool isSuccess;
  final dynamic jsonResponse;
  final String? errorMessage;

  ApiResponse({
    this.statusCode = -1,
    required this.isSuccess,
    this.jsonResponse,
    this.errorMessage = "Something went wrong. Try again later.",
  });
}
