import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/theme/color.dart';
import 'package:nssaccounting/widgetConfig.dart';
import 'package:nssaccounting/widgetTile.dart';

class SSM extends StatelessWidget {
  SSM({Key? key}) : super(key: key);

  final List<WidgetTileConfig> widgetTiles = WidgetConfig.ssmWidgetTiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widgetTiles[index].backgroundColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: NAColor.darken(widgetTiles[index].backgroundColor),
              ),
              child: Center(
                child: Text(
                  widgetTiles[index].title,
                  style: TextStyle(
                    fontSize: 20,
                    color:
                        NAColor.darken(widgetTiles[index].backgroundColor, 0.7),
                  ),
                ),
              )),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(
            widgetTiles[index].crossAxisCellCount,
            widgetTiles[index].mainAxisCellCount.toDouble()),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
