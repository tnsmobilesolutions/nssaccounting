import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/theme/color.dart';
import 'package:nssaccounting/widgetConfig.dart';
import 'package:nssaccounting/widgetTile.dart';

class Samilani extends StatelessWidget {
  Samilani({Key? key}) : super(key: key);

  final List<WidgetTileConfig> widgetTiles = WidgetConfig.sammilaniWidgetTiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(90, 120, 90, 100),
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
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0.0, 30.0),
                    blurRadius: 30.0,
                    color: Colors.black12)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 60.0,
                  width: 200.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 13.5, horizontal: 12.0),
                  // child: const Text(
                  //   'Add Branch',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //   ),
                  //   // style: Theme.of(context)
                  //   //     .textTheme
                  //   //     .button
                  //   //     ?.apply(color: Colors.black),
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.teal[300],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(89.0),
                      topLeft: Radius.circular(89.0),
                      bottomRight: Radius.circular(200.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widgetTiles[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        // color:
                        //     NAColor.darken(widgetTiles[index].backgroundColor, 0.7),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.money,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(
            widgetTiles[index].crossAxisCellCount,
            widgetTiles[index].mainAxisCellCount.toDouble()),
        mainAxisSpacing: 50.0,
        crossAxisSpacing: 80.0,
      ),
    );
  }
}
