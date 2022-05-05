// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_final_fields
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'dart:io';
import 'package:k_car_care_project/screen/profile_screen/components/textfield_item.dart';
import 'package:k_car_care_project/screen/profile_screen/main_profile_screen.dart';
import 'package:k_car_care_project/core/storage_data/user_profile_storage/store_care_information.dart';
import '../../core/shared/typography.dart';
import '../drawer_screen/main_drawer.dart';

class AddMoreInfoScreen extends StatefulWidget {
  const AddMoreInfoScreen({Key? key}) : super(key: key);

  @override
  _AddMoreInfoScreenState createState() => _AddMoreInfoScreenState();
}

class _AddMoreInfoScreenState extends State<AddMoreInfoScreen> {
  TextEditingController? yearcontroller;
  TextEditingController? makeController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? carTypeController;
  String? year = 'One Thousand';

  List<String?> years = ['2002', ' 2004', ' 2006'];

  XFile? imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  StoreCarInformation _storeCarInfo = StoreCarInformation();
  GlobalKey<FormState> formKey =  GlobalKey<FormState> ();

  @override
  void initState() {
    super.initState();
    yearcontroller = TextEditingController();
    makeController = TextEditingController();
    carTypeController = TextEditingController();
    modelController = TextEditingController();
    colorController = TextEditingController();
  }

  //***************Select Image From Gellery Fuction**************/
  // String? imageUrlCover;
  File? filePath;
  // SalaApi salaApi = SalaApi();
  String? imageUrlCover;
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
    // ignore: nullable_type_in_catch_clause
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Fail to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: Color(0xFFE5E5E5),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: defaultColor,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.off(() =>ProfileScreen());
          //   },
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.white,
          //   ),
          // ),
          title: Text(
            "Add Information",
            style: ThemeConstant.textTheme.headline6!.copyWith(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
            onPressed: () {
              Get.off(() =>ProfileScreen());
            },
            icon:Icon(
              Icons.clear_rounded,
              color: Colors.black,
            ),
          ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    // const SizedBox(height: 20),
                    // selLogo(context),
                    // const SizedBox(height: 20),
                    // Text('Login',
                    //   style: TypographyHelper.titleTextStyleBlack.copyWith(fontSize: 20, fontWeight: FontWeight.bold)
                    // ),
                    // const SizedBox(height: 15),
                    // Text(
                    //     'One account. One place to manage it all.\n Welcome to you account dashboard.',
                    //     textAlign: TextAlign.center,
                    //     style:TypographyHelper.subTitleTextStyleBlack.copyWith(
                    //         fontWeight: FontWeight.w400,
                    //         color: Colors.grey)),
                    // const SizedBox(height: 20),
                    // const GoogleBtn(
                    //   title: 'Login with Google',
                    // ),
                    // const CustomBtn(
                    //   title: 'Login with Bitriel',
                    //   logo: 'bitriel.svg',
                    // ),
                    // const SizedBox(height: 8.0),
                    // divider('or Login with Email'),
                    const SizedBox(height: 8.0),
                    EmailInput(
                      hideText: 'Title',
                      textEditingController: yearcontroller, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    const SizedBox(height: 8.0),
                    EmailInput(
                      hideText: 'Make',
                      textEditingController: yearcontroller, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    const SizedBox(height: 8.0),
                    EmailInput(
                      hideText: 'Model',
                      textEditingController: yearcontroller, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    const SizedBox(height: 8.0),
                    EmailInput(
                      hideText: 'Fuel',
                      textEditingController: yearcontroller, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    const SizedBox(height: 8.0),
                    EmailInput(
                      hideText: 'Year(2005,  ...)',
                      textEditingController: yearcontroller, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    // PassInput(
                    //   label: 'Password',
                    //   textEditingController: passwordInputController, 
                    //   onFieldSubmitted: (){
                    //     // validator!();
                    //   },
                    // ),
                    const SizedBox(height: 8.0),
                    // GestureDetector(
                    //   onTap:(){
                    //     // displayTextInputDialog(context,false);
                    //     showModalBottomSheet(
                    //         useRootNavigator: true,
                    //         isScrollControlled: true,
                    //         context: context,
                    //         clipBehavior: Clip.antiAlias,
                    //         shape: const RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.vertical(
                    //             top: Radius.circular(24),
                    //           ),
                    //         ),
                    //         builder: (context) {
                    //           return StatefulBuilder(builder:
                    //               (context, setModalState) {
                    //             return ReuseOptionSelectImage(
                    //               context: context,
                    //               onGallery: (){
                    //                 pickImage(ImageSource.gallery,false);
                    //                 Navigator.pop(context);
                    //               },
                    //               onCamara:(){
                    //                 pickImage(ImageSource.camera,false);
                    //                 Navigator.pop(context);
                    //               }
                    //           );
                    //           });
                    //         }
                    //       );
                    //   },
                    //   child: DottedBorder(
                    //     strokeWidth: 0.5,
                    //     color: Colors.grey.withOpacity(0.5),
                    //     borderType: BorderType.RRect,
                    //     // radius: Radius.circular(5),
                    //     padding : const EdgeInsets.all(0),
                    //     dashPattern: const [5, 4],
                    //     child: Container(
                    //         margin: const EdgeInsets.all(5),
                    //         height: 150,
                    //         decoration: BoxDecoration(
                    //           color: Color.fromARGB(255, 212, 196, 196).withOpacity(0.1),
                    //           // image: DecorationImage(
                    //           //   // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    //           //   image: FileImage(filePath!),
                    //           //   fit: BoxFit.fill,
                    //           // ),
                    //         ),
                    //         child: Center(
                    //           child: Column(
                    //             mainAxisSize:MainAxisSize.min,
                    //             children: [
                    //               const Icon(Icons.add_outlined,color:Colors.grey),
                    //               Text('Select Image',style:subTitleTextStyleBlack.copyWith(color:Colors.grey,fontWeight:FontWeight.w600 )),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //   ),
                    // ),

                      Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DottedBorder(
                                   strokeWidth: 0.5,
                                  color: Colors.grey.withOpacity(0.5),
                                  borderType: BorderType.RRect,
                                  // radius: Radius.circular(5),
                                  padding : const EdgeInsets.all(0),
                                  dashPattern: const [5, 4],
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * .3,
                                    width: MediaQuery.of(context).size.width * .5,
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.grey),
                                    ),
                            child: imageFile == null
                                  ? Image.asset(
                                      "assets/service_images/gallery_image.png",color:Colors.grey)
                                  : Image.file(
                                      File(imageFile!.path),
                                      fit: BoxFit.fill,
                                    ),
                          ),
                                ),
                          TextButton(
                            onPressed: () async {
                              await _getImage();
                            },
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
                        ],
                      ),
                  const SizedBox(height: 8.0),
                    SubmitButton(
                      text: 'Submit',
                      onPressed: () async {
                        // validator!();
                        // await submitLogin!();
                      },
                    ),
                    // TextButton(
                    //   onPressed: (){
                    //     Navigator.pushReplacementNamed(context, signUpRoute);
                    //   }, 
                    //   child: MyText(text: "Account sign up", fontWeight: FontWeight.w600, color2: Colors.blue,)
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
          
          // SingleChildScrollView(
          //   physics: const BouncingScrollPhysics(),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height * .04,
          //       ),
          //       Align(
          //         alignment: Alignment.topLeft,
          //         child: Text(
          //           "Please input correct information",
          //           style: ThemeConstant.textTheme.headline6!.copyWith(
          //             color: ThemeConstant.lightScheme.onBackground,
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //        EmailInput(
          //         textEditingController: yearcontroller,
          //         hideText: 'Year(2005, ...)', 
          //         onFieldSubmitted: (){
          //           // validator!();
          //         },
          //       ),
          //       TextFieldItem(
          //         textEditingController: makeController,
          //         title: "Make",
          //         hint: "Toyota",
          //       ),
          //       TextFieldItem(
          //         textEditingController: modelController,
          //         title: "Model",
          //         hint: "2022 Toyota... ",
          //       ),
          //       TextFieldItem(
          //         textEditingController: colorController,
          //         title: "Color",
          //         hint: "Black",
          //       ),
          //       TextFieldItem(
          //         textEditingController: carTypeController,
          //         title: "CarType",
          //         hint: "Van/Minivan",
          //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Container(
                //             height: MediaQuery.of(context).size.height * .3,
                //             width: MediaQuery.of(context).size.width * .5,
                //             decoration: BoxDecoration(
                //               border: Border.all(color: Colors.grey),
                //             ),
                //       child: imageFile == null
                //           ? Image.asset(
                //               "assets/service_images/gallery_image.png")
                //           : Image.file(
                //               File(imageFile!.path),
                //               fit: BoxFit.fill,
                //             ),
                //     ),
                //     TextButton(
                //       onPressed: () async {
                //         await _getImage();
                //       },
                //       child: Text(
                //         "Add Image",
                //         style: ThemeConstant.textTheme.headline6!.copyWith(
                //           color: ThemeConstant.lightScheme.primary,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
          //       SizedBox(
          //         height: 15,
          //       ),
          //       SizedBox(
          //         height: 60,
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           _storeCarInfo.carstorageInfo(
          //             year: yearcontroller?.text,
          //             make: makeController?.text,
          //             model: modelController?.text,
          //             color: colorController?.text,
          //             cartype: carTypeController?.text,
          //           );
          //           Get.offAll(() => ProfileScreen());
          //         },
          //         child: Container(
          //           alignment: Alignment.center,
          //           width: 140,
          //           height: 50,
          //           child:
          //               Text("Add", style: ThemeConstant.textTheme.subtitle1),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 40,
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final XFile? selectimage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    print(selectimage!.path);
    setState(
      () {
        imageFile = selectimage;
      },
    );
  }
}


class SubmitButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  const SubmitButton({
    this.text, 
    this.onPressed, 
    this.padding = const EdgeInsets.all(0), 
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HexColor primaryColor = HexColor('#00AAFF');
    const accentColor = Color(0xffffffff);

    const double borderRadius = 50;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: primaryColor
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  alignment: Alignment.center,
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(top: 20, bottom: 20)),
                  backgroundColor:
                      MaterialStateProperty.all(defaultColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius)),
                  )),
              onPressed: onPressed,
              child: Text(
                text!,
                style: titleTextStyleBlack.copyWith(color: accentColor,fontSize: 18,fontWeight: FontWeight.w600),
              ),
            )),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {

  final TextEditingController? textEditingController;
  final Function()? onFieldSubmitted;
  final String? hideText;

  const EmailInput({Key? key, required this.textEditingController, this.onFieldSubmitted, this.hideText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: (value) {
        //Do something wi
      },
      validator: (value) {
        // Check if this field is empty
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        // using regular expression
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Please enter a valid email address";
        }

        // the email is valid
        return null;
      },
      onFieldSubmitted: (String value){
        onFieldSubmitted!();
      },
      keyboardType: TextInputType.emailAddress,
      style: titleTextStyleBlack.copyWith(color: Colors.black87),
      decoration: InputDecoration(
        // label: const Text("Email"),
        //labelStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true, 
        hintText: hideText,
        hintStyle:bodyTextStyleBlack.copyWith(color: Colors.grey.withOpacity(.75)),
        isDense: true, 
        contentPadding: EdgeInsets.all(8),
        border:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    final hexNum = int.parse(hexColor, radix: 16);

    if (hexNum == 0) {
      return 0xff000000;
    }

    return hexNum;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
