import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/asset_manager.dart';
import '../../Utils/constant.dart';
import 'CustomText.dart';

InkWell _appBarTitle(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.fmd_good_sharp,
          color: Colors.black,
          size: 18,
        ),
        // Space between the icon and text
        CustomText(
          title: CommonConstant.deliverToDubai,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ],
    ),
  );
}

Container _appBarGradientContainer() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.blue.shade100, Colors.white]),
    ),
  );
}

AppBar profileAppBar(BuildContext context) {
  return AppBar(
    leading: const SizedBox(),
    flexibleSpace: _appBarFlexibleSpaceContainer(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          AppImageAsset.message,
        ),
      )
    ],
  );
}

Container _appBarFlexibleSpaceContainer() {
  return Container(
    color: const Color(0xFF022C3A),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            height: 95,
            width: 95,
            AppImageAsset.tradelingLogo,
          ),
        ),
      ],
    ),
  );
}

AppBar customAppBar(BuildContext context) {
  return AppBar(
    leading: const SizedBox(),
    centerTitle: true,
    title: _appBarTitle(context),
    flexibleSpace: _appBarGradientContainer(),
  );
}
