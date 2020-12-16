import 'package:flutter/material.dart';
import 'package:thanos/utils/screen.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/colors.dart';

List<Widget> menus = [
  SizedBox(
    height: 16,
  ),
  listTile(
    title: '工作量',
    iconData: Iconfont.icongongzuoliang,
  ),
  SizedBox(
    height: 2,
  ),
  listTile(
    title: '人才管理',
    iconData: Iconfont.iconrencaiguanli,
  ),
  SizedBox(
    height: 2,
  ),
  listTile(
    title: '企业管理',
    iconData: Iconfont.iconqiyeguanli,
  ),
  SizedBox(
    height: 2,
  ),
  listTile(
    title: '切换角色',
    iconData: Iconfont.iconqiehuanjiaose,
  )
];

Widget listTile({IconData iconData, String title}) {
  return ListTile(
    leading: Icon(
      iconData,
      color: AppColors.primaryIconText,
      // size: duSetWidth(32),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: duSetFontSize(36),
      ),
    ),
    trailing: Icon(Icons.keyboard_arrow_right),
  );
}

Widget userDrawer() {
  return Drawer(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: duSetWidth(60),
                  backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=250'),
                ),
                SizedBox(
                  width: duSetWidth(30),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "南京张炜00939",
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: duSetFontSize(36)),
                    ),
                    SizedBox(
                      height: duSetHeight(10),
                    ),
                    Text(
                      "郑州二公司企业一组",
                      style: TextStyle(
                          fontSize: duSetFontSize(28),
                          color: AppColors.secondaryText),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          ...menus,
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: duSetHeight(151)),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              textColor: AppColors.dangerText,
              child: Text(
                '退出登录',
                style: TextStyle(fontSize: duSetFontSize(36)),
              ),
              color: Colors.transparent,
              elevation: 0,
            ),
          )
        ],
      ),
    ),
  );
}
