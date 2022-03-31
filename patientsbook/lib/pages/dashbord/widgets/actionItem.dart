// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:patientsbook/pages/form_page.dart';

import '../../../common/app_colors.dart';
import '../../../helpers/Sizeconfig.dart';

class ActionItem extends StatelessWidget {
  final String _title;
  final String _imageAssets;

  ActionItem(this._title, this._imageAssets);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    // final authData = Provider.of<Auth>(context, listen: false);
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FormPage.routeName),
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
                image: AssetImage(_imageAssets),
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
                        _title,
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
