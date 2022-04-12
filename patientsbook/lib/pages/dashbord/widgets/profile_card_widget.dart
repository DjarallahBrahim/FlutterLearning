import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:provider/provider.dart';

import '../../../common/app_colors.dart';
import '../../../models/patients.dart';

class ProfileCardWidget extends StatefulWidget {
  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  late Isar isarBDD;
  var _nombreTotalDePatient;

  Stream<void>? patientWatcher;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    GetIt locator = GetIt.instance;
    isarBDD = locator<Isar>();
    patientWatcher = isarBDD.pastientDatass.watchLazy();
    var resultQuerry = await isarBDD.pastientDatass.where().count();
    // var resultQuerry2 = await isarBDD.pastientDatass.where().dateEntreProperty().;
    setState(() {
      _nombreTotalDePatient = resultQuerry;
    });
    patientWatcher?.listen((pastientDatass) async {
      resultQuerry = await isarBDD.pastientDatass.where().count();
      setState(() {
        _nombreTotalDePatient = resultQuerry;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final patientsData = Provider.of<Patients>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  "assets/doctor.png",
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: const [
                  Text(
                    "DR. Nom Prénom ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Doctor en ####"),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          profileListTile("Nombre de patients", _nombreTotalDePatient ?? ''),
          // profileListTile("Ajoutés cette semaine",
          //     patientsData.patientItem.length.toString()),
          // profileListTile("Accomplishment", "125"),
        ],
      ),
    );
  }

  Widget profileListTile(text, value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(
            value.toString(),
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
