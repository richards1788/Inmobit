import 'package:dio/dio.dart';
import 'package:getx_repaso/model/user.dart';

class UserAPI {
  UserAPI._internal();
  static UserAPI _instance = UserAPI._internal();
  static UserAPI get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response = await this._dio.get(
        'https://reqres.in/api/users',
        queryParameters: {
          'page': page,
          'delay': 4,
        },
      );
     return (response.data['data'] as List).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
