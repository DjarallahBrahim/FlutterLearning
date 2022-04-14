// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/models/patient.dart';
import 'package:patientsbook/pages/dashbord/widgets/patientFiltered.dart';
import 'package:patientsbook/pages/form_page.dart';

import '../../../common/app_colors.dart';
import '../../../helpers/Sizeconfig.dart';

class ActionItem extends StatefulWidget {
  final String title;
  final String imageAssets;
  final String actionType;
  final Function findPatientsFromBbb;
  ActionItem(
      {required this.title,
      required this.imageAssets,
      required this.actionType,
      required this.findPatientsFromBbb});

  @override
  State<ActionItem> createState() => _ActionItemState();
}

class _ActionItemState extends State<ActionItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  List<PastientDatas>? pastientData;

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.bgColor,
          title:
              Text('la fonctionnalité ${widget.title} sera bientôt disponible'),
          // content: SingleChildScrollView(
          //   child: ListBody(
          //     children: const <Widget>[
          //       Text('This is a demo alert dialog.'),
          //       Text('Would you like to approve of this message?'),
          //     ],
          //   ),
          // ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showInformationDialog(
      BuildContext context, String actionType) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColor.bgColor,
              content: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _textEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.black54),
                              labelStyle: Theme.of(context).textTheme.bodyText1,
                              hintText: "Nom",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.blue, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor.blue, width: 1.0),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.auto),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text("Choice Box"),
                        //       Checkbox(
                        //           value: isChecked,
                        //           onChanged: (checked) {
                        //             setState(() {
                        //               checked != null
                        //                   ? isChecked = checked
                        //                   : null;
                        //             });
                        //           })
                        //     ],
                        //   ),
                        // )
                        if (pastientData == null || pastientData!.isEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 13, bottom: 15),
                            child: Center(
                              child: Text(
                                'Lancer une recherche!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        if (pastientData != null && pastientData!.length > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 15),
                            child: Center(
                              child: Text(
                                'Résultat!',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        if (pastientData != null && pastientData!.isNotEmpty)
                          Expanded(
                              child: ListView.builder(
                            itemCount: pastientData!.length,
                            itemBuilder: (context, index) => patientFiltered(
                                patientData: pastientData![index],
                                actionType: actionType),
                          )),
                      ],
                    )),
              ),
              title: Center(
                  child: Text('Trouver un patient à l\'aide de son nom:')),
              alignment: Alignment.center,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // Do something like updating SharedPreferences or User Settings etc.
                          List<PastientDatas> result = await widget
                              .findPatientsFromBbb(_textEditingController.text);
                          setState(() {
                            pastientData = result;
                          });
                          //Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.yellow,
                            borderRadius: BorderRadius.circular(100)),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Lancer la recherche",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    pastientData = [];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    // final authData = Provider.of<Auth>(context, listen: false);
    return InkWell(
      onTap: () {
        if (widget.actionType == 'add')
          // Navigator.of(context).pushNamed(FormPage.routeName);
          Navigator.of(context).pushNamed(FormPage.routeName);
        else if (widget.actionType == 'search') {
          showInformationDialog(context, 'search').then((value) {
            setState(() {
              _textEditingController.text = '';
              pastientData = [];
            });
          });
        } else if (widget.actionType == 'exporte') {
          showInformationDialog(context, 'exporte').then((value) {
            setState(() {
              _textEditingController.text = '';
              pastientData = [];
            });
          });
        }
      },
      child: Card(
          color: AppColor.blue,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 16,
              // margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(widget.imageAssets),
                fit: BoxFit.contain,
                alignment: Alignment.topRight,
              )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, top: 8, bottom: 8, right: 30),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 1.5,
                            color: Colors.white),
                      ),
                    ),
                  ]))),
    );
  }
}
