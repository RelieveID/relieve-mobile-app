import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:relieve_app/res/res.dart';
import 'package:relieve_app/widget/item/standard_button.dart';

class FindUsername extends StatefulWidget {
  final VoidCallback onFinishClick;

  const FindUsername({Key key, this.onFinishClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FindUsernameState();
  }
}

enum AddPersonStep { Search, Found, Confirmation, Naming, Finish }

class FindUsernameState extends State<FindUsername> {
  var step = AddPersonStep.Search;

  void buttonClick() {
    setState(() {
      switch (step) {
        case AddPersonStep.Search:
          step = AddPersonStep.Found;
          break;
        case AddPersonStep.Found:
          step = AddPersonStep.Confirmation;
          break;
        case AddPersonStep.Confirmation:
          step = AddPersonStep.Naming;
          break;
        case AddPersonStep.Naming:
          step = AddPersonStep.Finish;
          break;
        case AddPersonStep.Finish:
          widget.onFinishClick();
          break;
      }
    });
  }

  List<Widget> getSearchStep(bool isUserNameExist) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.x16, vertical: Dimen.x12),
        child: Text(
          'Tambahkan keluarga mu',
          style: CircularStdFont.black.getStyle(size: Dimen.x21),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.x16, vertical: Dimen.x8),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Tulis username / email',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(Dimen.x14),
              child: LocalImage.ic_search
                  .toSvg(width: Dimen.x18, height: Dimen.x18),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimen.x6),
            ),
          ),
        ),
      ),
      Container(height: isUserNameExist ? Dimen.x16 : 0),
      isUserNameExist
          ? Row(
              children: <Widget>[
                Container(width: Dimen.x16),
                Center(
                  child: Container(
                    height: Dimen.x42,
                    width: Dimen.x42,
                    child: ClipOval(
                      child: Material(
                        child: Ink.image(
                          image: CachedNetworkImageProvider(
                              "https://blue.kumparan.com/kumpar/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1511853177/jedac0gixzhcnuozw7c4.jpg"),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: Dimen.x16),
                Expanded(
                  child: Text(
                    'Sultan Akbar',
                    style: CircularStdFont.medium.getStyle(size: Dimen.x18),
                  ),
                ),
                Container(width: Dimen.x16),
              ],
            )
          : Container(),
      Container(height: Dimen.x28),
      StandardButton(
        text: isUserNameExist ? 'Tambahkan ke Daftar' : 'Cari Username',
        backgroundColor: AppColor.colorPrimary,
        buttonClick: buttonClick,
      )
    ];
  }

  List<Widget> getConfirmationStep() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.x16, vertical: Dimen.x12),
        child: Text(
          'Masukkan kode unik',
          style: CircularStdFont.black.getStyle(size: Dimen.x21),
        ),
      ),
      Container(height: Dimen.x32),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: Dimen.x42,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimen.x6),
                ),
              ),
            ),
          ),
          Container(width: Dimen.x16),
          Container(
            width: Dimen.x42,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimen.x6),
                ),
              ),
            ),
          ),
          Container(width: Dimen.x16),
          Container(
            width: Dimen.x42,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimen.x6),
                ),
              ),
            ),
          ),
          Container(width: Dimen.x16),
          Container(
            width: Dimen.x42,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimen.x6),
                ),
              ),
            ),
          ),
          Container(width: Dimen.x16),
          Container(
            width: Dimen.x42,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimen.x6),
                ),
              ),
            ),
          ),
        ],
      ),
      Container(height: Dimen.x18),
      Center(
        child: Text(
          '05:00',
          style: CircularStdFont.book
              .getStyle(size: Dimen.x12, color: AppColor.colorTextGrey),
        ),
      ),
      Container(height: Dimen.x24),
      StandardButton(
        text: "Simpan",
        backgroundColor: AppColor.colorPrimary,
        buttonClick: buttonClick,
      )
    ];
  }

  List<Widget> getNamingStep() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.x16, vertical: Dimen.x12),
        child: Text(
          'Masukkan nama panggilan nya',
          style: CircularStdFont.black.getStyle(size: Dimen.x21),
        ),
      ),
      Container(height: Dimen.x16),
      Row(
        children: <Widget>[
          Container(width: Dimen.x16),
          Center(
            child: Container(
              height: Dimen.x64,
              width: Dimen.x64,
              child: ClipOval(
                child: Material(
                  child: Ink.image(
                    image: CachedNetworkImageProvider(
                        "https://blue.kumparan.com/kumpar/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1511853177/jedac0gixzhcnuozw7c4.jpg"),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Container(height: Dimen.x14),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.x16, vertical: Dimen.x8),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Nama Panggilan',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimen.x6),
            ),
          ),
        ),
      ),
      Container(height: Dimen.x24),
      StandardButton(
        text: "Simpan",
        backgroundColor: AppColor.colorPrimary,
        buttonClick: buttonClick,
      )
    ];
  }

  List<Widget> getSuccessStep() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimen.x16, vertical: Dimen.x12),
        child: Text(
          'Yeay keluarga mu berhasil di tambahkan!!',
          style: CircularStdFont.black.getStyle(size: Dimen.x21),
        ),
      ),
      Container(height: Dimen.x24),
      RemoteImage.boardingLogin.toImage(height: 210),
      Container(height: Dimen.x24),
      StandardButton(
        text: "Mulai Komunikasi!",
        backgroundColor: AppColor.colorPrimary,
        buttonClick: buttonClick,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var children = [];
    switch (step) {
      case AddPersonStep.Search:
        children = getSearchStep(false);
        break;
      case AddPersonStep.Found:
        children = getSearchStep(true);
        break;
      case AddPersonStep.Confirmation:
        children = getConfirmationStep();
        break;
      case AddPersonStep.Naming:
        children = getNamingStep();
        break;
      case AddPersonStep.Finish:
        children = getSuccessStep();
        break;
    }
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: children);
  }
}