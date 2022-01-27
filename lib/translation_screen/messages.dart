import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'hello':"Hello world",
      'logged_in':'logged in as @name \n email @email',
    },
    'es_ES':{
      'hello':'សួស្ដី',
      'logged_in':'inicido seion como @name \n e-mail @email',
    },
  };
}
