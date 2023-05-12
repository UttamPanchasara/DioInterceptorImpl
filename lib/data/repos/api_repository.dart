import 'package:dio/dio.dart';
import 'package:interceptor_impl/data/repos/entities%20/user_entity_response.dart';
import 'package:interceptor_impl/network/client/api_client.dart';
import 'package:interceptor_impl/network/rest_constants.dart';
import 'package:interceptor_impl/ui/userprofile/entity/user_entity.dart';

class ApiRepository {
  static final ApiRepository _converter = ApiRepository._internal();

  ApiRepository._internal();

  factory ApiRepository() {
    return _converter;
  }

  Future<UserEntity?> getUser() async {
    try {
      Response response = await ApiClient().dio().get(RestConstants.kGetUserProfile);

      return UserEntity.fromMap(response.data);
    } catch (e) {
      return null;
    }
  }
}
