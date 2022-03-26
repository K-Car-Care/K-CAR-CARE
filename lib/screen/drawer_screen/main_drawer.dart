// ignore_for_file: unused_field

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';
import 'package:launch_review/launch_review.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:share/share.dart';
import 'package:spring_button/spring_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/data/check_connectivity/check_connectivity.dart';
import '../../core/data/google_login/google_login_api.dart';
import '../../core/services/auth_services/auth_services.dart';
import 'components/about_us.dart';
import 'components/contact.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() =>
      // ignore: unnecessary_new
      new _NavigationDrawerWidgetState();
}

const expandedHeight = 180.0;

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  // late ScrollController _scrollController;
  String text = 'https://sala.koompi.com';
  String subject = 'View here';
  final GoogleLogin _googleLogin = GoogleLogin();
  bool islogin = false;
  String? url;
  String? avastar;
  String fullname = 'Full Name';
  String email = 'email@gmail.com';
  late ScrollController _scrollController;
  final _formKey = GlobalKey<FormState>();
  double rate = 2.0;
  TextEditingController controller = TextEditingController();
  String? imageUrlCover;
  String urlPlaystore = 'https://play.google.com/store/apps/developer?id=KOOMPI';

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() => setState(() {}));
    CheckInternet().checkConnection(context);
    super.initState();
  }

  final Authentication _authentication = Get.put(Authentication());
  @override
  void dispose() {
    CheckInternet().listener?.cancel();
    super.dispose();
  }

  ScrollController scrollController = ScrollController();

  bool get _showTitle {
    return _scrollController.hasClients &&
        _scrollController.offset > expandedHeight - (kToolbarHeight * 2);
  }


  //***************Select Image From Gellery Fuction**************/
  // String? imageUrlCover;
  File? filePath;
  // SalaApi salaApi = SalaApi();

  Future pickImage(ImageSource source,bool isAvatar) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() async{
        // ignore: unnecessary_this
        this.filePath = imageTemporary;
        // decodeFileCover(imageTemporary);
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Fail to pick image: $e");
    }
  }

  //  Future<String> decodeFileCover(File _images)async{
  //   String str = _images.toString();
  //    var arr = str.split('/');
  //    String imageName = arr[arr.length-1];

  //   List<int> compressImage = await FlutterImageCompress.compressWithFile(
  //     _images.path,
  //     minHeight: 1300,
  //     minWidth: 1000,
  //     quality: 100,
  //   );

  //   var multipartFile = new http.MultipartFile.fromBytes(
  //     'cover',
  //     compressImage,
  //     filename: imageName,
  //     contentType: MediaType.parse('image/jpeg'),
  //   );
  //   /* Make request */
  //    var request = new http.MultipartRequest(
  //       'POST', Uri.parse('https://salabackend.koompi.com/upload/cover')
  //     );
  //       request.files.add(multipartFile);
  //       /* Start send to server */
  //       http.StreamedResponse response = await request.send();
  //       /* Getting response */
  //       response.stream.transform(utf8.decoder).listen((data) {
  //         // var json = data;
  //         Map valueMap = json.decode(data);
  //         var mWelcome =  ProfileImage.fromJson(valueMap);
  //         setState(()   {
  //            imageUrlCover = "${mWelcome.fileName}";
  //         });
  //       });
  //   return imageUrlCover;
  // }

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      url = 'https://play.google.com/store/apps/details?id=com.koompi.sala';
    } else {
      url = 'https://apps.apple.com/kh/developer/puthea-khem/id1471748857';
    }
    return SizedBox(
      width:MediaQuery.of(context).size.width / 1.4,
      child: Drawer(
          child: Container(
            color: Colors.white,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading:false,
                  leading:_showTitle? IconButton(
                    icon: const Icon(Icons.edit,size: 17, color:  Colors.white),
                    onPressed: () {
                      // Navigator.pushNamed(context, EditProfileView);
                    },
                  ):null,
                  actions: const [
                    // ButtonDarkMode(),
                  ],
                  expandedHeight:expandedHeight,
                  centerTitle:false,
                  titleSpacing:0.0,
                  title: _showTitle
                      ? Row(
                        children:[
                        const CircleAvatar(radius:20 ,backgroundImage: NetworkImage('https://sala.koompi.com/images/default/Avatar(144_144).png')),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text(fullname.isEmpty ? 'Full Name':fullname, style:subTitleTextStyleBlack ),
                            Text(email.isEmpty ? 'Student Email':email, style:subTitleTextStyleBlack.copyWith(color:  Colors.white.withOpacity(0.5),)),
                          ],
                        ),
                        ]
                      )
                      : null,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: AnimatedOpacity(
                      opacity: _showTitle ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                  decoration: BoxDecoration(color:defaultColor, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
                  child: Column(
                    mainAxisSize:MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          RotatedBox(
                            quarterTurns: -2,
                            child: CircularPercentIndicator(
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor:  Colors.grey.withOpacity(0.3),
                              radius: 30,
                              lineWidth: 4.0,
                              percent: 0.53,
                              progressColor:Colors.white
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage('https://sala.koompi.com/images/default/Avatar(144_144).png'),
                                      fit: BoxFit.cover
                                  )
                                ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fullname.isEmpty ? "Full Name":fullname,
                          style: bodyTextStyleWhite.copyWith(fontWeight: FontWeight.w600,fontSize:10,color:  Colors.black),
                        ),
                      const SizedBox(height: 5),
                      Text(
                        email.isEmpty ? "Student Email":email,
                        style:bodyTextStyleWhite.copyWith(color:  Colors.black.withOpacity(0.5),fontSize:10),
                      ),
                    ],
                  ),
                ),
                ),
                background: Container(
                  color: defaultColor,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                BuildMenuItem(
                  text:'Setting',
                      // _lang.translate('contact'),
                      //'ការកំណត់',
                  icon: Icons.contacts_outlined,
                  onClicked: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => const Contact()));
                  }
                ),
                BuildMenuItem(
                    text:
                        // _lang.translate('help'),
                        'Help and Support',
                    icon: Icons.help_center_outlined,
                    onClicked: () {
                      // Navigator.push(
                      //   context,
                      //   RouteAnimation(enterPage: HelpSupport()),
                      // );
                    }),
                BuildMenuItem(
                    text:
                        // _lang.translate('feedback'),
                        'Feeback',
                    icon: Icons.message_outlined,
                    onClicked: () {
                       showModalBottomSheet(
                        useRootNavigator: true,
                        isScrollControlled: true,
                        context: context,
                        clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          builder:(context) => SingleChildScrollView(
                            child: Container(
                              color:Colors.white,
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: Form(
                                  key:_formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        // SizedBox(height: 5),
                                        BuildLineTop(context: context),
                                        const SizedBox(height: 10),
                                        Text("What do you think after using K-CAR-CARE APP?",style: subTitleTextStyleBlack.copyWith(fontWeight:FontWeight.w600)),
                                        const SizedBox(height: 10),
                                        BuildForm(
                                          hideText: 'Feedback here.....',
                                            context: context,
                                            disscuson: controller,
                                            maxLines: 3,
                                            onSaved:(value){

                                            }
                                          ),
                                        const SizedBox(height: 7),
                                        BuildRate(
                                        context: context,
                                        rate: 0,
                                        onRatingUpdate: (value){
                                          setState(() {
                                            rate = value;
                                          });
                                        }
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap:(){
                                          // displayTextInputDialog(context,false);
                                          showModalBottomSheet(
                                              useRootNavigator: true,
                                              isScrollControlled: true,
                                              context: context,
                                              clipBehavior: Clip.antiAlias,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(24),
                                                ),
                                              ),
                                              builder: (context) {
                                                return StatefulBuilder(builder:
                                                    (context, setModalState) {
                                                  return ReuseOptionSelectImage(
                                                    context: context,
                                                    onGallery: (){
                                                      pickImage(ImageSource.gallery,false);
                                                      Navigator.pop(context);
                                                    },
                                                    onCamara:(){
                                                      pickImage(ImageSource.camera,false);
                                                      Navigator.pop(context);
                                                    }
                                                );
                                                });
                                              }
                                            );
                                        },
                                        child: DottedBorder(
                                          strokeWidth: 0.5,
                                          color: Colors.grey.withOpacity(0.5),
                                          borderType: BorderType.RRect,
                                          // radius: Radius.circular(5),
                                          padding : const EdgeInsets.all(0),
                                          dashPattern: const [5, 4],
                                          child: Container(
                                              margin: const EdgeInsets.all(5),
                                              height: 150,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(0.1),
                                                image: DecorationImage(
                                                  // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                                  image: NetworkImage(imageUrlCover == '' ?  'https://c4.wallpaperflare.com/wallpaper/126/306/559/simple-background-white-wallpaper-preview.jpg' :"https://salabackend.koompi.com/public/uploads/$imageUrlCover"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:MainAxisSize.min,
                                                  children: [
                                                    const Icon(Icons.add_outlined,color:Colors.grey),
                                                    Text('Select Image',style:subTitleTextStyleBlack.copyWith(color:Colors.grey,fontWeight:FontWeight.w600 )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      showEnrollButton(
                                        onTap:()async{
                                          //------Do Operation Rate App
                                          // ignore: avoid_print
                                          print('Do Operation Rate App');
                                        }
                                      ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ),
                        );
                    }),
                BuildMenuItem(
                  text:
                      // _lang.translate('contact'),
                      'Contact',
                  icon: Icons.contacts_outlined,
                  onClicked: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Contact()));
                  }
                ),
                BuildMenuItem(
                  text:
                      // _lang.translate('share'),
                      'Share',
                  icon: Icons.share_outlined,
                  onClicked: () {
                    final renderbox = context.findRenderObject() as RenderBox;
                    Share.share(text,subject: subject,sharePositionOrigin: renderbox.localToGlobal(Offset.zero) & renderbox.size);
                  }
                ),

                BuildMenuItem(
                text:// _lang.translate('contact'),
                    'Rate App',
                icon: Icons.star_rounded,
                onClicked: () {
                  LaunchReview.launch(
                    androidAppId: 'com.koompi.sala' ,
                    // iOSAppId: config.rate_ios,
                  );
                }),
                BuildMenuItem(
                  text:
                      // _lang.translate('share'),
                      'Other App',
                  icon: Icons.mobile_friendly_outlined,
                  onClicked: () {
                    return launchURL();
                }),
                BuildMenuItem(
                    text:
                        // _lang.translate('aboutus'),
                        'About us',
                    icon: Icons.workspaces_outline,
                    onClicked: () {
                      // MyNavigator.goToAboutUs(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutUs()));
                    }),
                const Divider(color: Colors.white70),
                BuildMenuItem(
                    text:
                        // _lang.translate('chang_lang'),
                        'Language',
                    icon: Icons.language_outlined,
                    onClicked: () {
                       showModalBottomSheet(
                          useRootNavigator: true,
                          context: context,
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setModalState) {
                              return AlertChangeLanguage(
                                responsive: MediaQuery.of(context).size.height,
                                onTapKH: () {
                                  Navigator.pop(context);
                                  // data.setLocal('KH', context);
                                },
                                onTapEH: () {
                                  Navigator.pop(context);
                                  // data.setLocal('EN', context);
                                },
                              );
                            });
                          });
                    }),
                BuildMenuItem(
                    text:
                        // _lang.translate('logout'),
                        'Logout',
                    icon: Icons.login_outlined,
                    onClicked: () {
                       showModalBottomSheet(
                          shape: BottomSheetShape(),
                          backgroundColor: Colors.black54,
                          context: context,
                          builder: (context) {
                            return BottomLogoutStyle(
                              question:'តើអ្នកពិតជាចង់ចាកចេញមែនទេ?',
                              logout: () async {
                                // await signOut();
                                // Navigator.pushReplacement(
                                //     context, RouteAnimation(enterPage: Signin()));
                              },
                            );
                          });
                    }),
              ]),
            ),
            ],
        ),
          )
  ),
    );
  }


  Widget showEnrollButton({required Function onTap}) {
    return Container(
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: SpringButton(
          SpringButtonType.WithOpacity,
          ScrollToHideWidget(
            size: MediaQuery.of(context).size.height,
            controller: scrollController,
            key: null,
            child: buildEnrollButton(onTap: (){}),
          ),
          onTap:() => onTap
      ,)
    );
  }

  Widget buildEnrollButton({required Function onTap}) {
    return PushableButton(
        child: Text('Send',
            style: titleTextStyleWhite.copyWith(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w600)),
        height: 50,
        elevation: 5,
        hslColor: HSLColor.fromColor(defaultColor),
        shadow: BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 2),
        ),
        onPressed:() => onTap
      );
  }

  void launchURL() async => await canLaunch(urlPlaystore) ? await launch(urlPlaystore) : throw 'Could not launch $urlPlaystore';
}



class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onClicked,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration( shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
        child: Icon(icon, color: Colors.grey, size: 20)
      ),
      title: Text(text,style: bodyTextStyleBlack.copyWith(color: Colors.black,fontWeight: FontWeight.w600,)),
      hoverColor: hoverColor,
      onTap: onClicked
    );
  }
}



class BuildLineTop extends StatelessWidget {
  const BuildLineTop({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 100,
        height: 3,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}



class BuildForm extends StatelessWidget {
  const BuildForm({
    Key? key,
    required this.context,
    required this.disscuson,
    required this.onSaved,
    required this.hideText,
    required this.maxLines,
  }) : super(key: key);

  final BuildContext context;
  final TextEditingController disscuson;
  final Function onSaved;
  final int maxLines;
  final String hideText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: disscuson,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5.0),
        hintText: hideText,
        hintStyle: bodyTextStyleBlack.copyWith(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
      style: bodyTextStyleBlack,
      maxLines: maxLines,
      onSubmitted: (value) {
        onSaved(value);
      },
    );
  }
}



class BottomLogoutStyle extends StatelessWidget {
  final Function logout;
  final String question;
  const BottomLogoutStyle({
    Key? key, 
    required this.logout, 
    required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 16,
        left: 48,
        right: 48,
      ),
      height: 180,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
              // question,
              "តើអ្នកពិតជាចង់ចាកចេញមែនទេ?",
              textAlign: TextAlign.center,
              style: subTitleTextStyleWhite.copyWith(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                // ignore: deprecated_member_use
                child: OutlineButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderSide:const BorderSide(
                    color: Colors.white,
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                      // _lang.translate('no'),
                      "ទេ",
                      style: bodyTextStyleBlack.copyWith(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MaterialButton(
                  onPressed:() => logout,
                  color: Colors.white,
                  child: Text(
                      // _lang.translate('yes'),
                      "ចាស/បាទ",
                      style: bodyTextStyleBlack.copyWith(color: Colors.black)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





class BottomSheetShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    
    return path;
  }
}



class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final double size;
  const ScrollToHideWidget({
    required Key? key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
    required this.size,
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listen);
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        isVisible = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? widget.size : 0,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          widget.child,
        ],
      ),
    );
  }
}






class BuildRate extends StatelessWidget {
  const BuildRate({
    Key? key,
    required this.context,
    required this.rate,
    required this.onRatingUpdate,
  }) : super(key: key);

  final BuildContext context;
  final int rate;
  final Function onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      alignment: Alignment.centerLeft,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   color: AppColorConstant.getGreyColor(context).withOpacity(0.2),
      // ),
      child: RatingBar.builder(
        initialRating: rate.toDouble(),
        minRating: 0.5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate:(value) => onRatingUpdate,
      ),
    );
  }
}




class ReuseOptionSelectImage extends StatelessWidget {
  const ReuseOptionSelectImage({
    Key? key,
    required this.context,
    required this.onGallery,
    required this.onCamara,
  }) : super(key: key);

  final BuildContext context;

  final VoidCallback onGallery;
  final VoidCallback onCamara;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)),
    ),
    child: Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius:1.0,
                    offset: const Offset(0.0, 0.75)
                )
              ],
            color: Colors.white,
          ),
          child: ListTile(
            leading: const Icon(Icons.camera),
            title: Text('កាម៉ារ៉ា',style:subTitleTextStyleBlack.copyWith(fontWeight:FontWeight.w600)),
            onTap:onCamara,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListTile(
            leading: const Icon(Icons.image),
            title: Text('វិចិត្រសាល',style:subTitleTextStyleBlack.copyWith(fontWeight:FontWeight.w600)),
            onTap:onGallery,
          ),
        ),
      ],
      ) 
    );
  }
}


class AlertChangeLanguage extends StatelessWidget {
  final VoidCallback onTapEH;
  final VoidCallback onTapKH;
  final double responsive;
  const AlertChangeLanguage({
    Key? key,
    required this.onTapEH,
    required this.onTapKH,
    required this.responsive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          const SizedBox(height: 5),
          BuildLineTop(context: context),
          GestureDetector(
            onTap: onTapEH,
            child: ListTile(
              leading: const ResueLeadingLogo(imgUrl: 'https://vectorflags.s3.amazonaws.com/flags/uk-circle-01.png'),
              title:  Text('English',style: bodyTextStyleBlack),
              // trailing:  const Container()
              //Icon(Icons.check_circle,  color: defaultColor),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: onTapKH,
            child: ListTile( 
              leading: const ResueLeadingLogo(imgUrl: 'https://cdn.countryflags.com/thumbs/cambodia/flag-round-250.png'),
              title: Text('Khmer', style: bodyTextStyleBlack),
              trailing: const Icon(Icons.check_circle,  color: defaultColor),
            ),
          )
        ],
      ),
    );
  }
}



class ResueLeadingLogo extends StatelessWidget {
  final String imgUrl;
  const ResueLeadingLogo({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imgUrl,)),
      ),
    );
  }
}
