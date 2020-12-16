import 'package:flutter/material.dart';
import 'package:thanos/utils/screen.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/colors.dart';
import 'package:thanos/widgets/widgets.dart';

class PoolPage extends StatefulWidget {
  PoolPage({Key key}) : super(key: key);

  @override
  _PoolPageState createState() => _PoolPageState();
}

class _PoolPageState extends State<PoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      body: Column(
        children: [
          Text('heelo'),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return item(index);
              },
              itemCount: 200,
            ),
          )
        ],
      ),
    );
  }
}

Widget item(int index) {
  return Container(
    margin: EdgeInsets.fromLTRB(
      duSetWidth(30),
      0,
      duSetWidth(30),
      duSetHeight(20),
    ),
    padding: EdgeInsets.all(duSetWidth(30)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: AppColors.primaryBackground,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: duSetWidth(20)),
              child: Icon(
                Iconfont.iconzuixin,
                color: AppColors.dangerText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: duSetWidth(10)),
              child: Text(
                '张三',
                style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: duSetFontSize(36)),
              ),
            ),
            Container(
              child: badge('闲置中'),
              margin: EdgeInsets.only(right: duSetWidth(10)),
            ),
            badge('A类'),
            Spacer(),
            Container(
              height: duSetWidth(60),
              child: OutlineButton(
                padding: EdgeInsets.symmetric(
                  horizontal: duSetWidth(24),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textColor: AppColors.primaryColor,
                borderSide: BorderSide(color: AppColors.primaryColor),
                onPressed: () {},
                child: Text(
                  '50币/领取',
                  style: TextStyle(fontSize: duSetFontSize(28)),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: duSetHeight(20),
        ),
        Text('一万元以下 丨 男 丨 四川·成都 丨以下四川·成都 丨以下四川·成都 丨以下 '),
      ],
    ),
  );
}
