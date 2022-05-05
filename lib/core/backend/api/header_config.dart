import 'package:http/http.dart' as http;

class Backend{

  Map<String, dynamic> token = {}; 
  
  String bodyEncode = "";

  http.Response? response;

  Map<String, dynamic>? mapData;

  List<dynamic>? listData;

  dynamic data;

  Map<String, String> conceteHeader({required String value}) { /* Concete More Content Of Header */
    return value != '' 
    ? { /* if Parameter != Null = Concete Header With  */
      "Content-Type": "application/json; charset=utf-8", 
      "token": value
    }
    : { /* if Parameter Null = Don't integrate */
      "Content-Type": "application/json; charset=utf-8"
    };
  }
}