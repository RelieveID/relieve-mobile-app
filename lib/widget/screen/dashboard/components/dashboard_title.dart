import 'package:flutter/material.dart';
import 'package:relieve_app/res/export.dart';

enum RelieveTitleStyle { light, dark }

class RelieveTitle extends StatelessWidget {
  final RelieveTitleStyle style;

  const RelieveTitle({Key key, this.style = RelieveTitleStyle.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Relieve',
      style: CircularStdFont.black.getStyle(
          size: Dimen.x21,
          color: (style == RelieveTitleStyle.dark)
              ? AppColor.colorPrimary
              : Colors.white),
    );
  }
}
