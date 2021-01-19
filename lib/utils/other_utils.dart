import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:thanos/widgets/message.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// 调起拨号页
  static Future<void> launchTelURL(String phone) async {
    final String url = 'tel:' + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Message.show('拨号失败！');
    }
  }

  static String formatPrice(String price,
      {MoneyFormat format = MoneyFormat.END_INTEGER}) {
    return MoneyUtil.changeYWithUnit(
        NumUtil.getDoubleByValueStr(price), MoneyUnit.YUAN,
        format: format);
  }

  static KeyboardActionsConfig getKeyboardActionsConfig(
      BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardBarColor: Colors.white,
      nextFocus: true,
      actions: List.generate(
          list.length,
          (i) => KeyboardActionsItem(
                focusNode: list[i],
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text('关闭'),
                      ),
                    );
                  },
                ],
              )),
    );
  }
}

Future<T> showElasticDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 550),
    transitionBuilder: _buildDialogTransitions,
  );
}

Widget _buildDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: SlideTransition(
      position: Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero)
          .animate(CurvedAnimation(
        parent: animation,
        curve: const ElasticOutCurve(0.85),
        reverseCurve: Curves.easeOutBack,
      )),
      child: child,
    ),
  );
}
