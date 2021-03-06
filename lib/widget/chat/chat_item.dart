import 'package:flutter/material.dart';
import 'package:relieve_app/datamodel/chat.dart';
import 'package:relieve_app/res/export.dart';
import 'package:relieve_app/widget/screen/message/message_screen.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({
    Key key,
    @required this.chat,
  }) : super(key: key);

  void onChatClick(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => MessageScreen(this.chat)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => onChatClick(context),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Dimen.x16,
              vertical: Dimen.x8,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(chat.isRead ? 0 : 2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.colorPrimary,
                        width: 2,
                      )),
                  child: CircleAvatar(
                    radius: Dimen.x28,
                    child: Text('NE'),
                  ),
                ),
                Container(width: Dimen.x21),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Nia ramadhani',
                              overflow: TextOverflow.ellipsis,
                              style: CircularStdFont.bold.getStyle(
                                size: Dimen.x16,
                              ),
                            ),
                          ),
                          Text(
                            '12:00',
                            style: CircularStdFont.book.getStyle(
                              size: Dimen.x14,
                              color: AppColor.colorTextGrey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: Dimen.x32,
                        child: Text(
                          'Sayang sudah makan?',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CircularStdFont.book.getStyle(
                            size: Dimen.x14,
                            color: AppColor.colorTextGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(height: 1, color: Theme.of(context).dividerColor)
      ],
    );
  }
}
