class BaseResponse<T> {
  T? data;
  bool? success;
  String? errorMessage;

  BaseResponse({
    this.data,
    this.success,
    this.errorMessage,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        data: json['data'],
        success: json['success'] ?? false,
      );
}
