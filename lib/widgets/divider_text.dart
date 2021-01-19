import 'package:flutter/material.dart';
import 'package:thanos/utils/utils.dart';

class DividerText extends StatelessWidget {
  final String text;
  const DividerText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: duSetHeight(20)),
      child: Row(
        children: [
          SizedBox(
            width: duSetWidth(40),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: duSetWidth(20)),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(text),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: duSetWidth(20)),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: duSetWidth(40),
          )
        ],
      ),
    );
  }
}
