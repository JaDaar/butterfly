import 'package:butterfly/data/users.dart';
import 'package:butterfly/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  // https://api.openweathermap.org/data/2.5/onecall?lat=38.795479&lon=-77.6125977&appid=b433ac492e753557edf383a0d70e2aa0
class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'b433ac492e753557edf383a0d70e2aa0';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    print('URI to get data is: $uri');
    http.Response response = await http.get(uri);

    Map<String, dynamic> data = json.decode(response.body);
    Weather weather=Weather.fromJson(data);
    return weather;
  }
}
//http://localhost:3000/users
class UserHelper{
  //  replace localhost reference with local machine IP
  final String authority='192.168.1.47:3000';
  final String path='users';

  Future<User> getUsers() async {
    Uri uri=Uri.http(authority, path);
    print('URI to get data is: $uri');
    http.Response response = await http.get(uri);
    List<dynamic> userList=json.decode(response.body);
    User usr=User.fromJson(userList);
    return usr;
  }
}