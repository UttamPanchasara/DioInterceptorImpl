import 'package:dio/dio.dart';
import 'package:interceptor_impl/data/repos/entities%20/user_entity_response.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({'token': 'lkhjxgskjhdgakj'});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    UserEntityResponse model = UserEntityResponse.fromJson(response.data);

    response.data = {
      'email': model.results?.first.email,
      'lName': model.results?.first.name?.last,
      'fName': model.results?.first.name?.first,
    };
    return super.onResponse(response, handler);
  }
}
