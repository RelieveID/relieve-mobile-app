import 'package:flutter/material.dart';
import 'package:relieve_app/datamodel/family.dart';
import 'package:relieve_app/res/export.dart';
import 'package:relieve_app/service/firebase/firestore_helper.dart';
import 'package:relieve_app/widget/common/bottom_modal.dart';
import 'package:relieve_app/widget/family/add_family_modal.dart';
import 'package:relieve_app/widget/family/family_item.dart';

class FamilyItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FamilyItemListState();
  }
}

class FamilyItemListState extends State {
  // TODO: clean up last before release
//  static const List<Family> _defaultFamilyList = const [
//    Family(
//      uid: '',
//      profile: Profile(
//        fullName: 'Ayah',
//        imageUrl:
//            'https://blue.kumparan.com/kumpar/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1511853177/jedac0gixzhcnuozw7c4.jpg',
//      ),
//      condition: Condition(health: Health.Fine),
//    ),
//    Family(
//      uid: '',
//      profile: Profile(
//        fullName: 'Ibu',
//        imageUrl:
//            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Suzy_Bae_at_fansigning_on_February_3%2C_2018_%284%29.jpg/220px-Suzy_Bae_at_fansigning_on_February_3%2C_2018_%284%29.jpg',
//      ),
//      condition: Condition(health: Health.Bad),
//    ),
//    Family(
//      uid: '',
//      profile: Profile(
//        fullName: 'Kak dinda',
//        imageUrl:
//            'https://www.sbs.com.au/popasia/sites/sbs.com.au.popasia/files/styles/full/public/twice-tzuyu-7.jpg',
//      ),
//      condition: Condition(health: Health.None),
//    )
//  ];

  List<Family> familyList = const [];
  int allowedFamilyCount = 3;

  void loadFamilyList() async {
    final families = await FirestoreHelper.get().getFamilies() ?? const [];
    if (!mounted) return;
    setState(() {
      familyList = families;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadFamilyList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: double.infinity,
      child: familyList.isNotEmpty ? _createFilledList() : _createEmptyList(),
    );
  }

  Widget _createEmptyList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: Dimen.x12,
        ),
        FamilyItem.empty(),
        FamilyItem.add(onClick: addFamilyClick),
        Container(width: Dimen.x12),
      ],
    );
  }

  Widget _createFilledList() {
    List<Widget> content = [
      Container(
        width: Dimen.x12,
      ),
    ];
    familyList.asMap().forEach((index, fam) => content.add(
          FamilyItem.normal(
            family: fam,
            onClick: () => personClick(index),
          ),
        ));
    content.addAll([
      allowedFamilyCount > 0
          ? FamilyItem.add(onClick: addFamilyClick)
          : Container(),
      Container(width: Dimen.x12),
    ]);

    return ListView(
      scrollDirection: Axis.horizontal,
      children: content,
    );
  }

  void addFamilyClick() async {
    final isSuccess = await AddFamilyModal.showModal(context);
    if (isSuccess is! bool || !isSuccess) return;

    // reload family list
    loadFamilyList();
  }

  void personClick(int position) {
    RelieveBottomModal.create(context, <Widget>[
      Container(height: Dimen.x21),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.x16),
        child: Text(
          'Clicked on ${familyList[position].label}',
          style: CircularStdFont.book.getStyle(size: Dimen.x16),
        ),
      ),
    ]);
  }
}
