import 'package:flutter/material.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/values.dart';

Widget customerAppBar({
  @required TabController controller,
  @required String avatar,
  VoidCallback onLeadingPress,
  VoidCallback onSearchTap,
  List<Widget> tabs,
}) {
  return AppBar(
    leading: IconButton(
      icon: Container(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(avatar),
          )),
      onPressed: onLeadingPress,
    ),
    actions: [
      IconButton(
          icon: Icon(Iconfont.iconsousuo),
          iconSize: duSetFontSize(40),
          onPressed: onSearchTap)
    ],
    centerTitle: true,
    title: TabBar(
      tabs: tabs,
      controller: controller,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.primaryText,
      indicatorPadding: EdgeInsets.all(0),
      indicator: BoxDecoration(),
    ),
    elevation: 0,
  );
}
