import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/widgetConfig.dart';
import 'package:nssaccounting/widgetTile.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, this.loggedInUser}) : super(key: key);

  final AppUser? loggedInUser;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<WidgetTileConfig> widgetTiles = WidgetConfig.widgetTiles;

  @override
  Widget build(BuildContext context) {
    print(widget.loggedInUser?.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text("NSS Accounting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: widgetTiles.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widgetTiles[index].widget),
              );
            },
            child: new Container(
                color: widgetTiles[index].backgroundColor,
                child: Column(
                  children: [
                    Text(widgetTiles[index].title),
                    Text(widgetTiles[index].subTitle)
                  ],
                )),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(
              widgetTiles[index].crossAxisCellCount,
              widgetTiles[index].mainAxisCellCount.toDouble()),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ),
    );
  }
}
