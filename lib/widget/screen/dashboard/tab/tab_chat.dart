import 'package:flutter/material.dart';
import 'package:relieve_app/datamodel/chat.dart';
import 'package:relieve_app/res/export.dart';
import 'package:relieve_app/service/api/bakau/bakau_provider.dart';
import 'package:relieve_app/service/api/base/api.dart';
import 'package:relieve_app/widget/chat/chat_item.dart';
import 'package:relieve_app/widget/common/title.dart';

class TabChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabChatScreenState();
  }
}

class TabChatScreenState extends State {
  List<Chat> chatList = [];

  void loadChat() async {
    final chats =
        await Api.get().setProvider(BakauProvider()).getAllChat(1, 10);

    if (chats == null || !mounted) return;
    setState(() {
      chatList = chats;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadChat();
  }

  @override
  Widget build(BuildContext context) {
    return chatList.isNotEmpty ? buildFilledChat() : buildEmptyChat();
  }

  Expanded buildEmptyChat() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: Dimen.x16,
              top: Dimen.x24,
              bottom: Dimen.x12,
            ),
            child: ScreenTitle(title: 'Chat'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 250,
                    width: 250,
                    color: AppColor.colorEmptyChip,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimen.x16),
                  child: Text(
                    'Tidak ada chat aktif',
                    style: CircularStdFont.bold.getStyle(
                      size: Dimen.x16,
                      color: AppColor.colorTextCharcoal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: Dimen.x64 + Dimen.x18),
                  child: Text(
                    'Ayo hubungi keluarga mu, Tunjukkan kasih sayang kepada mereka.',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: CircularStdFont.book.getStyle(
                      size: Dimen.x12,
                      color: AppColor.colorTextGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildFilledChat() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: Dimen.x24,
        ),
        itemBuilder: (context, position) {
          if (position == 0) {
            return Padding(
              padding: const EdgeInsets.only(
                left: Dimen.x16,
                bottom: Dimen.x12,
              ),
              child: ScreenTitle(title: 'Chat'),
            );
          } else {
            return ChatItem(chat: chatList[position - 1]);
          }
        },
        itemCount: chatList.length + 1, // + 1 title
      ),
    );
  }
}
