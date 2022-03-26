
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: defaultColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text('Flat Tire Service',
            style: ThemeConstant.textTheme.bodyText1),
        actions: [
          IconButton(
            // ignore: prefer_const_constructors
            icon: (Icon(Icons.notifications, color: Colors.white)),
            onPressed: () {},
          ),
        ]),
      body: SingleChildScrollView(
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(AppImages.logoImg,width: 130,height: 130,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'ធ្វើការទំនាក់ទំនងមកយើងគ្រប់ពេលប្រសិនបើអ្នកជូបប្រទះនូវបញ្ហារឺត្រូវការជំនួយបន្ថែម។',
                        textAlign: TextAlign.center,
                        style: subTitleTextStyleBlack,
                      ),
                    )
                    ],
                ),
              ),
              const SizedBox(height: 8),
              ReuseCardWithBorder(
                child: Column(
                children: [
                  Text(
                    "ទំនាក់ទំនងតាមរយ:",
                    style: subTitleTextStyleBlack,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContactNetwork(imgUrl:AppImages.assetCellCardLogo,name: 'Cellcard',onPress: (){ FlutterPhoneDirectCaller.callNumber("0964444222");},),
                      ContactNetwork(imgUrl:AppImages.assetMetfoneLogo,name: 'Metfone',onPress: (){ FlutterPhoneDirectCaller.callNumber("0964444222");},),
                      ContactNetwork(imgUrl:AppImages.assetSmartLogo,name: 'Smart',onPress: (){ FlutterPhoneDirectCaller.callNumber("0964444222");},),
                    ]),
                  ],
                ),
              ),
              ReuseCardWithBorder(
                child: Column(
                children: [
                  Text(
                    "ទំនាក់ទំនងតាមប្រព័ន្ធ",
                    style: subTitleTextStyleBlack,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContactNetwork(imgUrl:AppImages.assetFBsLogo,name: 'Facebook',onPress: (){
                        // launchUniversalLinkIos("https://web.facebook.com/koompi.kh");
                        // Navigator.push(context, RouteAnimation(enterPage: WebViewUrl(url:'https://web.facebook.com/TopAuto' ,title: 'ហ្វេសប៊ុក')));
                        
                      }),
                      ContactNetwork(imgUrl:AppImages.assetTelegramLogo,name: 'Telegram',onPress: (){
                        // launchUniversalLinkIos("https://t.me/koompi");
                      }),
                      ContactNetwork(imgUrl:AppImages.assetGmailLogo,name: 'Gmail',onPress: (){
                        // Navigator.push(context, RouteAnimation(enterPage: WebViewUrl(url:'https://topautocam.com' ,title: 'អុីម៉ែល')));
                      }),
                    ]),
                  ],
                ),
              ),
              ReuseCardWithBorder(
                child: Column(
                children: [
                  Text(
                    "ចូលទៅកាន់វេបសាយ",
                    style: subTitleTextStyleBlack,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContactNetwork(imgUrl:AppImages.assetWebsiteLogo,name: 'Website',onPress: (){
                        // launchUniversalLinkIos("https://sala.koompi.com");
                        // Navigator.push(context, RouteAnimation(enterPage: WebViewUrl(url:'https://sala.koompi.com' ,title: 'វេបសាយ')));
                      }),
                    ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}



class ContactNetwork extends StatelessWidget {
  final String imgUrl;
  final String name;
  final VoidCallback onPress;
  const ContactNetwork({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: defaultColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          const SizedBox(height: 8),
           Text(
              name,
              style: bodyTextStyleBlack,
           )
         ],
        ),
      ),
    );
  }
}



class ReuseCardWithBorder extends StatelessWidget {
  final Widget child;
  const ReuseCardWithBorder({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: defaultColor,width: 1),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Align(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}




class FlutterPhoneDirectCaller {
  static const MethodChannel _channel =
      MethodChannel('flutter_phone_direct_caller');

  static Future<bool?> callNumber(String number) async {
    return await _channel.invokeMethod(
      'callNumber',
      <String, Object>{
        'number': number,
      },
    );
  }
}
