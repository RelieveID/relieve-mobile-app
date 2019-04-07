import "package:flutter/material.dart";
import 'package:relieve_app/app_config.dart';
import "package:relieve_app/res/res.dart";
import 'package:relieve_app/service/model/disaster.dart';
import 'package:relieve_app/service/service.dart';
import "package:relieve_app/widget/item/disaster_item.dart";
import "package:relieve_app/widget/item/title.dart";

class DashboardDiscoverScreen extends StatefulWidget {
  @override
  _DashboardDiscoverScreenState createState() =>
      _DashboardDiscoverScreenState();
}

class _DashboardDiscoverScreenState extends State<DashboardDiscoverScreen> {
  void loadDisaster() async {
    final listDisaster =
        await KalomangApi(AppConfig.of(context)).getDisasterList(1, 10);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadDisaster();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimen.x16,
                  top: Dimen.x24,
                  bottom: Dimen.x12,
                ),
                child: ScreenTitle(title: "Discover"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimen.x16,
                  right: Dimen.x16,
                  top: Dimen.x12,
                  bottom: Dimen.x24,
                ),
                child: DiscoverItem(
                  disaster: Disaster(
                    isLive: true,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              ThemedTitle(
                title: "Highlight Bencana",
              )
            ]),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: DisasterItem(
                  width: 185,
                  disaster: Disaster(
                    isLive: false,
                    title: "Gunung Semeru Meletus",
                    location: "Probolinggo, Jawa Timur",
                    time: DateTime.now(),
                    coordinate: Location(37.42796133580664, -122.085749655962),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
