import 'dart:convert';

import 'package:http/http.dart' as http;

class SignUpUserServices {
  // static Future SignUpUser({
  //   String? firstname,
  //   String? lasttname,
  //   String? username,
  //   String? password,
  // }) async {
  //   Map<String, dynamic> reqBody = ({
  //     'first_name': firstname,
  //     'last_name': lasttname,
  //     'username': username,
  //     'password': password,
  //     'avatar':
  //         'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp',
  //   });
  //   http.Response response = await http.post(
  //     Uri.parse(''https://codelineinfotech.com/student_api/User/signup.php''),
  //     body: reqBody,
  //   );
  //   var result = jsonDecode(response.body);
  //   print('-->> ${response.body}');
  //   return result;
  // }

  static Future signup(Map<String, dynamic> reqBody) async {
    http.Response response = await http.post(
      Uri.parse('https://codelineinfotech.com/student_api/User/signup.php'),
      body: reqBody,
    );

    var result = jsonDecode(response.body);
    print('-->>${response.body}');
    return result;
  }
}
