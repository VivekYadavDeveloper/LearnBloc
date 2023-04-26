import 'package:bloc_api_project/models/users.model.dart';

import 'package:http/http.dart' as http;

class UsersRepo {
  Future<List<UsersModel>> getUsersList() async {
    var endPointUrl = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      throw ("Faild To Load The User List");
    }
  }
}
