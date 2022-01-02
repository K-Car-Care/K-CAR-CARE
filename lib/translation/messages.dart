import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //HomeScreen
          'page': "OverView",
          'name_service': 'Service',
          'des_service':'Towing,Fuel,Flat,Tire,Key Service',
          'logged_in': 'logged in as @name \n email @email',
          
          //Service
        },
        'kh_KH': {
          'page': 'ទិដ្ឋភាពទូទៅ',
          'name_service': 'សេវាកម្ម',
          'des_service':'ឡានអូសទាញ,ឡានប្រេងសាំង',
          'logged_in': 'inicido seion como @name \n e-mail @email',
        },
      };
}
