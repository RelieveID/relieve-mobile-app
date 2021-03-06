import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:relieve_app/datamodel/address.dart';
import 'package:relieve_app/datamodel/family.dart';
import 'package:relieve_app/res/export.dart';
import 'package:relieve_app/utils/preference_utils.dart';
import 'package:relieve_app/widget/common/relieve_scaffold.dart';
import 'package:relieve_app/widget/common/title.dart';
import 'package:relieve_app/widget/family/family_list.dart';
import 'package:relieve_app/widget/profile/user_location.dart';
import 'package:relieve_app/widget/screen/call/call_list.dart';
import 'package:relieve_app/widget/screen/call/components/item_button.dart';

class CallScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CallScreenState();
}

class CallScreenState extends State {
  final addressIndex = PreferenceUtils.get().currentActiveAddress;
  final profile = PreferenceUtils.get().currentUserProfile;

  Address address;

  void getUserAddress() async {
    if (!mounted) return;
    setState(() {
      address = profile.addresses[addressIndex];
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserAddress();
  }

  @override
  Widget build(BuildContext context) {
    return RelieveScaffold(
      hasBackButton: true,
      backIcon: LocalImage.icCross,
      crossAxisAlignment: CrossAxisAlignment.start,
      childs: <Widget>[
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Dimen.x16,
                      top: Dimen.x16,
                      bottom: Dimen.x12,
                    ),
                    child: ScreenTitle(title: 'Lokasi Saat Ini'),
                  ),
                  UserLocation(
                    location: ReCase(address?.label ?? 'Mendeteksi Lokasi...')
                        .titleCase,
                    icon: LocalImage.icMap,
                    personHealth: Health.None,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimen.x32),
                    child: ThemedTitle(title: 'Lembaga Penanganan Darurat'),
                  )
                ]),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: Dimen.x16),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: Dimen.x6,
                  mainAxisSpacing: Dimen.x6,
                  children: <Widget>[
                    ItemButton(
                      icon: LocalImage.icPolice,
                      title: 'Kantor Polisi',
                    ),
                    ItemButton(
                      icon: LocalImage.icAmbulance,
                      title: 'Ambulance',
                    ),
                    ItemButton(
                      icon: LocalImage.icRedCross,
                      title: 'Palang Merah',
                    ),
                    ItemButton(
                      icon: LocalImage.icFireFighter,
                      title: 'Pemadam Kebakaran',
                    ),
                    ItemButton(
                      icon: LocalImage.icSar,
                      title: 'Badan SAR',
                    ),
                    ItemButton(
                      icon: LocalImage.icOthers,
                      title: 'Lainnya',
                      isTintBlue: true,
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CallListScreen()));
                      },
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: Dimen.x32),
                    child: ThemedTitle(title: 'Panggilan Cepat'),
                  )
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  FamilyItemList(),
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
