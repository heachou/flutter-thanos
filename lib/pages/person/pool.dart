import 'package:flutter/material.dart';
import 'package:thanos/utils/screen.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/colors.dart';
import 'package:thanos/widgets/widgets.dart';
import 'package:thanos/pages/person/widget/widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PoolPage extends StatefulWidget {
  PoolPage({Key key}) : super(key: key);

  @override
  _PoolPageState createState() => _PoolPageState();
}

class _PoolPageState extends State<PoolPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;

  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
              duSetWidth(36),
              duSetWidth(30),
              duSetWidth(36),
              duSetHeight(20),
            ),
            child: personTips(todayUpdate: 101, total: 1811, coins: 1830),
          ),
          Expanded(
            child: EasyRefresh.custom(
              enableControlFinishRefresh: false,
              enableControlFinishLoad: true,
              controller: _controller,
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 2), () {
                  print('onRefresh');
                  setState(() {
                    _count = 20;
                  });
                  _controller.resetLoadState();
                });
              },
              onLoad: () async {
                await Future.delayed(Duration(seconds: 2), () {
                  print('onLoad');
                  setState(() {
                    _count += 10;
                  });
                  _controller.finishLoad(noMore: _count >= 100);
                });
              },
              header: MaterialHeader(),
              footer: MaterialFooter(),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return item(index);
                    },
                    childCount: _count,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget item(int index) {
  TextStyle grayTextStyle = TextStyle(
    color: AppColors.labelGrayText,
    fontSize: duSetFontSize(24),
  );
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
                '张三$index',
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
        Text(
          '一万元以下 丨 男 丨 四川·成都 丨以下四川·成都 丨以下四川·成都 丨以下 ',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: duSetFontSize(32),
          ),
        ),
        SizedBox(
          height: duSetHeight(20),
        ),
        Text(
          '跟进内容跟进内容，这是跟进内容跟进内容。',
          style: TextStyle(
            color: AppColors.labelGrayText,
            fontSize: duSetFontSize(24),
          ),
        ),
        SizedBox(
          height: duSetHeight(22),
        ),
        Container(
          child: Row(
            children: [
              Text(
                '更新时间：2018/02/14 13:3',
                style: grayTextStyle,
              ),
              Spacer(),
              Text(
                '拨打：23',
                style: grayTextStyle,
              ),
              Container(
                margin: EdgeInsets.only(left: duSetWidth(20)),
                child: Text(
                  '领取：15',
                  style: grayTextStyle,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
