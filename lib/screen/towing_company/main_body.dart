import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import '../../core/data/towing_service_api.dart';
import '../../core/model/towing_company.dart';
import '../../core/shared/typography.dart';
import 'components/history_towing.dart';
import 'components/list_car_towing.dart';

class TowingCompany extends StatefulWidget {
  const TowingCompany({ Key? key }) : super(key: key);
  @override
  _TowingCompanyState createState() => _TowingCompanyState();
}

class _TowingCompanyState extends State<TowingCompany>  with TickerProviderStateMixin{

  TabController? _tabController;

  TowingServiceApi towingServiceApi = TowingServiceApi();
  List<GetTowingInfo>? listTowing;
  TowingCompanyModel? getTowingInfo;
  List<UserCars>? getCarTowing;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener((){
      // onTab(_tabController!.index);
    });

    initList();
    super.initState();
  }

  void initList () async {
    getTowingInfo = await towingServiceApi.readTowingCompany();
    listTowing = getTowingInfo!.getTowingInfo;
    getCarTowing = listTowing![0].userCars;
    setState(() {    

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              listTowing != null ?  ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: [
                        Image.network(
                          'https://www.nicepng.com/png/detail/165-1651672_pembroke-towing-797-main-rd-cartoon-tow-truck.png',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.3,
                          fit: BoxFit.cover,
                        ),
                        // if (model!.cover.contains("https"))
                        // Image.network(
                        //   model.cover,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height / 3.3,
                        //   fit: BoxFit.cover,
                        // ),
                        // if (!model.cover.contains("https") && !model.cover.contains("assets/images")) 
                        // Image.file(
                        //   File(model.cover),
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height / 3.3,
                        //   fit: BoxFit.cover,
                        // ),
                        // if (model.cover.contains("assets/images")) 
                        // Image.asset(
                        //   model.cover,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height / 3.3,
                        //   fit: BoxFit.cover,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.3,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width),
                      height: MediaQuery.of(context).size.height / 3.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              ImageEditComponent(
                                image: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.network(
                                      listTowing?[0].img ??'',
                                      height: 110,
                                      width: 110,
                                      fit: BoxFit.cover,
                                    ),
                                ),
                              ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              listTowing?[0].title ??'',
                              style: subTitleTextStyleWhite.copyWith(fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            padding:const EdgeInsets.all(5),
                            child: const Icon(Icons.create_rounded,color: Colors.white,),
                          ),
                        ),
                      )
                    )
                  ],
                )
              ):Container(
                height: 200,
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                onTap: (index){
                  _tabController!.index = index;
                    setState(() {
                  });
                },
                tabs: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Icon(Icons.toys_rounded, size: 30, color: _tabController!.index == 0 ? Colors.black: Colors.grey,),
                            ),
                            // provider.successSubmitToBlockchain
                            // ? Positioned(
                            //   child: Image.asset(AppConfig.iconPath+"check.png", width: 20),
                            //   right: 0,
                            //   bottom: 0
                            // ) 
                            // : Container()
                          ],
                        ),
                      ),
                      Text(
                          'Towing Car',style: subTitleTextStyleBlack.copyWith(
                          color: _tabController!.index == 0? Colors.black : Colors.grey,
                          fontWeight: _tabController!.index == 0 ? FontWeight.bold : FontWeight.w600
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Icon(Icons.history_rounded, size: 30, color: _tabController!.index == 1 ? Colors.black : Colors.grey,),
                        ),
                        Text(
                            'History',style: subTitleTextStyleBlack.copyWith(
                            color: _tabController!.index == 1? Colors.black : Colors.grey,
                            fontWeight: _tabController!.index == 1 ? FontWeight.bold : FontWeight.w600
                          )
                        ),
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Icon(Icons.history_edu_rounded, size: 30, color: _tabController!.index == 2 ? Colors.black : Colors.grey,)
                        ),
                        Text(
                            'Report',style: subTitleTextStyleBlack.copyWith(
                            color: _tabController!.index == 2 ? Colors.black: Colors.grey,
                            fontWeight: _tabController!.index == 2 ? FontWeight.bold : FontWeight.w600
                          )
                        ),
                      ],
                    ),
                  )
                ]
              ),
              // titleDashboard(
              //   dashModel!.titlePage, 
              //   context, 
              //   title2: tabController!.index == 0 ? InkWell(
              //     onTap: (){
              //       edit!();
              //     }, 
              //     child: MyText(text: dashModel!.isEditing ? "Un-do" : "Edit", fontWeight: FontWeight.bold, textAlign: TextAlign.right, right: paddingSize, color2: Colors.blue,)
              //   ) : Container()
              // )
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 1.1,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SizedBox(
                      height: double.infinity,
                      child: ListCarTowing(getCarTowing:getCarTowing),
                    ),
                    const SizedBox(
                      height: double.infinity,
                      child:  HistoryTowing(),
                    ),
                    Container(
                      height: double.infinity,
                      color: defaultColor,
                    ),
                    // PersonlInfo(model: dashModel, edit: edit, submitEdit: submitEdit),
                    // IdentityInfo(dashBoardModel: dashModel, submitEdit: edit),
                    // AccountLinked(),
                  ]
                ),
              )
            ],
          )
        )
      )
    );
  }
}

class ImageEditComponent extends StatelessWidget{
  final Widget? image;
  final Function? action;

  /// Custom Widget That For Image With Edit Icon Button
  const ImageEditComponent({ Key? key,this.image, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        image!,
        // Positioned(
        //   top: 5,
        //   right: 5,
        //   child: IconButton(
        //     onPressed: (){
        //       action!();
        //     }, 
        //     icon: Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Colors.white
        //       ),
        //       padding: EdgeInsets.all(5),
        //       child: Icon(Icons.edit_outlined),
        //     )
        //   ),
        // )
      ],
    );
  }
}