//import 'package:flutter/material.dart';

// class AuthApiService {
//   //Login Function
//   Future<_http.Response> login(
//       {BuildContext context,
//       String email,
//       String passwords,
//       String timeLogin,
//       bool statusLogin}) async {
//     /* User Login */
//     _backend.bodyEncode = json.encode({
//       /* Convert to Json String */
//       "email": email,
//       "password": passwords
//     });
//     _backend.response = await _http.post(Uri.parse('${_salaApi.restApi}/login'),
//         headers: _backend.conceteHeader(null, null), body: _backend.bodyEncode);
//     var code = _backend.response.statusCode;
//     var responseJson = json.decode(_backend.response.body);
//     if (code == 200) {
//       // print(responseJson);
//       // //Save User info and response info
//       // // Services.timeRecorded = DateTime.now().millisecondsSinceEpoch;
//       // prefService.saveString('timeLogin',  DateTime.now().millisecondsSinceEpoch.toString());
//       // prefService.saveString('userEmail', email);
//       // prefService.saveString('userPass', passwords);
//       // prefService.saveString('_id', responseJson['_id']);
//       // prefService.saveString('role', responseJson['role']);
//       // prefService.saveString('accessToken', responseJson['access_token']);
//       // prefService.saveString('refreshToken', responseJson['refresh_token']);
//       // prefService.saveString('isLogin', 'alreadyLogin');
//       // //Decode access_token
//       // JwtDecode.tryParseJwt(responseJson['access_token'], context);
//       // //setToken for GraphQL Clients
//       // GraphQLConfiguration.setToken(responseJson['access_token']);
//       // //Alert Loading and push to next screen
      
//     } else if (code == 400) {
      
//     } else {
      
//       throw Exception('Failed to load data!');

//       // print("Message: "+ responseJson['message']);
//     }
//     return _backend.response;
//   }
// }