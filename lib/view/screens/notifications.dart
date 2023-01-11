import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  List<Map> notificatioItems = [
    {
      "paragraph": "مبروك .. لقد حصلت علي كوبون خصم بقيمة 5% علي طلبك القادم",
      "imgUrl": "assets/images/white-logo.png",
      "Date": "2022-4-2-9:45"
    },
    {
      "paragraph": "مبروك .. لقد حصلت علي كوبون خصم بقيمة 5% علي طلبك القادم",
      "imgUrl": "assets/images/white-logo.png",
      "Date": "2022-4-2-9:45"
    },
    {
      "paragraph": "مبروك .. لقد حصلت علي كوبون خصم بقيمة 5% علي طلبك القادم",
      "imgUrl": "assets/images/white-logo.png",
      "Date": "2022-4-2-9:45"
    },
    {
      "paragraph": "مبروك .. لقد حصلت علي كوبون خصم بقيمة 5% علي طلبك القادم",
      "imgUrl": "assets/images/white-logo.png",
      "Date": "2022-4-2-9:45"
    },
    {
      "paragraph": "مبروك .. لقد حصلت علي كوبون خصم بقيمة 5% علي طلبك القادم",
      "imgUrl": "assets/images/white-logo.png",
      "Date": "2022-4-2-9:45"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("الاشعارات"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: ListView.builder(
                    itemCount: notificatioItems.length,
                    itemBuilder: (context, index) => Card(
                          elevation: 0,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: Color(0xfff1f1f1), width: 2)),
                            leading: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeApp.mainColor),
                              child: Image.asset(
                                notificatioItems[index]['imgUrl'],
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            title: Text(
                              notificatioItems[index]['paragraph'],
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            subtitle: Text(
                              notificatioItems[index]['Date'],
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        )))));
  }
}
