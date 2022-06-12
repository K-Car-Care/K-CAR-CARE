import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_images.dart';
import '../../../core/constant/theme_constant.dart';
import '../../../core/provider/state_change_notifier.dart';
import '../../redesign_expense_ui/json/daily_json.dart';
import '../../redesign_expense_ui/list_expense_category/main_body.dart';

class HistoryTowing extends StatefulWidget {
  const HistoryTowing({ Key? key }) : super(key: key);

  @override
  _HistoryTowingState createState() => _HistoryTowingState();
}

class _HistoryTowingState extends State<HistoryTowing> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width * 0.6;
    final stateNotifier = Provider.of<StateChangeNotifier>(context);
    return Scaffold(
      body: Container(
          // margin:const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]), // margin: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
                children: List.generate(daily.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const ListExpenseCategory()));
                },
                child: Container(
                  // margin: const EdgeInsets.only(left: 8, right: 8,top:8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: stateNotifier.legendIndex == index
                      ? const Color(0xFFFFF8E5).withOpacity(0.5)
                      : white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (size.width - 40) * 0.7,
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppImages.assetCarExpense,
                                      width: 35,
                                      height: 35,
                                      //  color:,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                  width: (size.width - 90) * 0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Towing history $index',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: black.withOpacity(0.8),
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        daily[index]['date'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: black.withOpacity(0.5),
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            //  width: (size.width - 40) * 0.1,
                            child: Text(
                              "${daily[index]['price']}",
                              style:  TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: const Color(0xffFF5771).withOpacity(0.7)),
                            ),
                          )
                        ],
                      ),
                      //  Divider(
                      //    thickness: 0.8,
                      //  )
                    ],
                  ),
                ),
              );
            }
            )
        ),
          ),
        ),
    );
  }  


// This is a block of Model Dialog 
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
}

class CatalogImage extends StatelessWidget {
  final String? image;
  const CatalogImage({Key? key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image!,
    );
  }
}