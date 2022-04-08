import 'package:flutter/material.dart';
import 'package:patientsbook/pages/dashbord/widgets/patientItem.dart';
import 'package:patientsbook/pages/dashbord/widgets/userActions.dart';
// import 'package:patientsbook/pages/dashbord/widgets/card_item.dart';
import 'package:patientsbook/pages/dashbord/widgets/header_widget.dart';
import 'package:patientsbook/pages/dashbord/widgets/profile_card_widget.dart';

import '../../common/app_colors.dart';
import '../../helpers/Sizeconfig.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          /// Header Part
          HeaderWidget(),

          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    // flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          // NotificationCardWidget(),
                          UserActions(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 2, child: PatientItem()),
                              SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 10),
                              Expanded(flex: 1, child: ProfileCardWidget()),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  // if (!AppResponsive.isMobile(context))
                  //   Expanded(
                  //     child: Container(
                  //       margin: EdgeInsets.symmetric(horizontal: 10),
                  //       child: Column(
                  //         children: [
                  //           // const Text("Calendar was here"),
                  //           // SizedBox(
                  //           //   height: 20,
                  //           // ),
                  //           ProfileCardWidget(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
