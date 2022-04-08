import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patientsbook/pages/patientDetail_page.dart';
import 'package:provider/provider.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import '../../../models/patient.dart';
import '../../../models/patients.dart';
import '../../form_page.dart';

class PatientItem extends StatefulWidget {
  @override
  _PatientItemWidgetState createState() => _PatientItemWidgetState();
}

class _PatientItemWidgetState extends State<PatientItem> {
  @override
  Widget build(BuildContext context) {
    final patientsData = Provider.of<Patients>(context, listen: true);
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
                InkWell(
                  onTap: () =>
                      {Navigator.of(context).pushNamed(FormPage.routeName)},
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.yellow,
                        borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(
                      "Ajouter",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: AppColor.black),
                    ),
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
                    //     ListView.builder(
                    // itemBuilder: (ctx, index) => tableRowCustom(ctx, patientsData.patientItem[index]),
                    // itemCount: patientsData.patientItem.length,)
                  ],
                ),

                for (patient pt in patientsData.patientItem)
                  tableRowCustom(context, pt),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // Text("Showing 4 out of 4 Results"),
                  // Text(
                  //   "View All",
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
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

  TableRow tableRowCustom(context, patient patientData) {
    var formatter = DateFormat('yyyy-MM-dd');
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
          InkWell(
            onTap: () => {
              Navigator.of(context).pushNamed(PatientDetailPage.routeName,
                  arguments: patientData.id)
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      patientData.sex.toLowerCase() == "homme"
                          ? "assets/homme.png"
                          : "assets/femme.png",
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('${patientData.nom} ${patientData.prenom}')
                ],
              ),
            ),
          ),
          // Designation
          if (!AppResponsive.isMobile(context))
            Text(formatter.format(patientData.dateEntre)),
          //Status
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: patientData.dateSortie != null &&
                          (patientData.dateSortie!
                                  .isAfter(patientData.dateEntre) ||
                              patientData.dateSortie!
                                  .isAtSameMomentAs(patientData.dateEntre))
                      ? Colors.green
                      : Colors.red,
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              patientData.dateSortie != null &&
                      (patientData.dateSortie!.isAfter(patientData.dateEntre) ||
                          patientData.dateSortie!
                              .isAtSameMomentAs(patientData.dateEntre))
                  ? Text("Sortie")
                  : Text("Hospitalisé"),
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
