import 'package:flutter/material.dart';

import '../../res/font.dart';
import '../../res/color.dart';

class ThemedTitle extends StatelessWidget {
    final String title;
    final String subtitle;

    ThemedTitle({this.title, this.subtitle});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 26, right: 26, top: 8, bottom: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(
                        title,
                        style: CircularStdFont.getFont(
                            style: CircularStdFontStyle.Bold,
                            size: 22
                        )
                    ),
                    SizedBox(height: 6,),
                    Text(
                        subtitle,
                        style: CircularStdFont.getFont(
                            style: CircularStdFontStyle.Book,
                            size: 14
                        ).apply(
                            color: AppColor.colorTextGrey
                        ),
                    ),
                ],
            ),
        );
    }
}