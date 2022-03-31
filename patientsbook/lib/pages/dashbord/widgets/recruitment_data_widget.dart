import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';

class RecruitmentDataWidget extends StatefulWidget {
  @override
  _RecruitmentDataWidgetState createState() => _RecruitmentDataWidgetState();
}

class _RecruitmentDataWidgetState extends State<RecruitmentDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Historique",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                    fontSize: 22,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.yellow,
                      borderRadius: BorderRadius.circular(100)),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.black),
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                /// Table Header
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    )),
                  ),
                  children: [
                    tableHeader("Nom Prénom"),
                    if (!AppResponsive.isMobile(context))
                      tableHeader("Date d'entré"),
                    tableHeader("Status"),
                    // if (!AppResponsive.isMobile(context)) tableHeader(""),
                  ],
                ),

                /// Table Data
                tableRow(
                  context,
                  name: "Mary G Lolus",
                  color: Colors.blue,
                  image: "assets/user1.jpg",
                  designation: "2022/10/08",
                  status: "Hospitalisé",
                ),
                tableRow(
                  context,
                  name: "Vince Jacob",
                  color: Colors.blue,
                  image: "assets/user2.jpg",
                  designation: "2022/10/08",
                  status: "Hospitalisé",
                ),
                tableRow(
                  context,
                  name: "Nell Brian",
                  color: Colors.green,
                  image: "assets/user3.jpg",
                  designation: "2022/10/17",
                  status: "Hospitalisé",
                ),
                tableRow(
                  context,
                  name: "Vince Jacob",
                  color: Colors.yellow,
                  image: "assets/user2.jpg",
                  designation: "2022/10/01",
                  status: "Hospitalisé",
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Showing 4 out of 4 Results"),
                  Text(
                    "View All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow tableRow(context, {name, image, designation, status, color}) {
    return TableRow(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        children: [
          //Full Name
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(
                    image,
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(name)
              ],
            ),
          ),
          // Designation
          if (!AppResponsive.isMobile(context)) Text(designation),
          //Status
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(status),
            ],
          ),
          // Menu icon
          // if (!AppResponsive.isMobile(context))
          //   Image.asset(
          //     "assets/more.png",
          //     color: Colors.grey,
          //     height: 30,
          //   )
        ]);
  }

  Widget tableHeader(text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
      ),
    );
  }
}
