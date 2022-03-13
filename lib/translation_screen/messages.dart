import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      //Choose Language Screen
      'WELCOME':"Welcome",
      'logged_in':'logged in as @name \n email @email',
      //Register Screen
      'WELCOME_REGISTER':'Welcome to be here',
      'PLEASE_FILL':'Please fill form to be our Member',
      'EXAMPLE':'For Example: Choose country code first'
    },
    'es_ES':{
      //Choose Language Screen
      'WELCOME':'សូមស្វាគមន៍',
      'logged_in':'inicido seion como @name \n e-mail @email',

      //Register Screen
      'WELCOME_REGISTER':'សូមស្វាគមន៍មកកាន់ទីនេះ',
      'PLEASE_FILL':'បំពេញទម្រង់បែបបទដើម្បីក្លាយជាភ្ញៀវរបស់យើង',
      'EXAMPLE':'ជ្រើសរើស កូដប្រទេស លេខទូរស័ព្ទ'



      
 
    },
  };
}
