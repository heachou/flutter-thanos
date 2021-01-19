import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:thanos/global.dart';
import 'package:thanos/routes/app_pages.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/values.dart';
import 'package:thanos/widgets/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _status = 0;
  final List<String> _guideList = ['app_start_1', 'app_start_2', 'app_start_3'];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _guideList.forEach((image) {
        precacheImage(
            ImageUtils.getAssetImage(image, format: ImageFormat.webp), context);
      });
    });
    super.initState();
    _initSplash();
  }

  void _goLogin() {
    Global.isFirstOpen = false;
    Get.offAllNamed(Routes.LOGIN);
  }

  void _initSplash() {
    SpUtil.putBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    _initGuide();
  }

  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }

  double height = 1334 - 88 - 68.0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(750.0, height),
      allowFontScaling: true,
    );
    return Scaffold(
        body: _status == 0
            ? FractionallyAlignedSizedBox(
                heightFactor: 0.3,
                widthFactor: 0.33,
                leftFactor: 0.33,
                bottomFactor: 0,
                child: const LoadAssetImage('logo'))
            : Swiper(
                key: const Key('swiper'),
                itemCount: _guideList.length,
                loop: false,
                itemBuilder: (_, index) {
                  return LoadAssetImage(
                    _guideList[index],
                    key: Key(_guideList[index]),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    format: ImageFormat.webp,
                  );
                },
                onTap: (index) {
                  if (index == _guideList.length - 1) {
                    _goLogin();
                  }
                },
              ));
  }
}
