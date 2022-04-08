// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:patientsbook/pages/form_page.dart';

import '../../../common/app_colors.dart';
import '../../../helpers/Sizeconfig.dart';

class ActionItem extends StatelessWidget {
  final String title;
  final String imageAssets;
  final String actionType;

  ActionItem(
      {required this.title,
      required this.imageAssets,
      required this.actionType});
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.bgColor,
          title: Text('la fonctionnalité $title sera bientôt disponible'),
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    // final authData = Provider.of<Auth>(context, listen: false);
    return InkWell(
      onTap: () {
        if (actionType == 'add')
          // Navigator.of(context).pushNamed(FormPage.routeName);
          Navigator.of(context).pushNamed(FormPage.routeName);
        else
          _showMyDialog(context);
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
                image: AssetImage(imageAssets),
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
                        title,
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
