import 'package:flutter/material.dart';
import 'package:nssaccounting/Theme/color.dart';
import 'package:nssaccounting/receipt/sm_dinikia_paali.dart';
import 'package:nssaccounting/receipt/ssm_dinikia_paali.dart';
import 'package:nssaccounting/widgetTile.dart';

class WidgetConfig {
  static final List<WidgetTileConfig> widgetTiles = [
    new WidgetTileConfig(
        widget: SMDinikiaPaali(),
        title: "ଦିନିକିଆ ପାଳି",
        subTitle: "ସ୍ମୃତି ମନ୍ଦିର",
        backgroundColor: NAColor.dinikiaPaaliSM,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SSMDinikiaPaali(),
        title: "ଦିନିକିଆ ପାଳି",
        subTitle: "ସତ୍ ଶିକ୍ଷା ମନ୍ଦିର",
        backgroundColor: NAColor.dinikiaPaaliSSM,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Bidyanidhi",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.bidyaNidhi,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Nirvikalpa Siddhisthala",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.nirvikalpa,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "କେନ୍ଦ୍ର Unnayana",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.kendraUnnayana,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Swastya Seva",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.healthSeva,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Sthai Nityabhoga",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.sthayiNityaBhoga,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Daridranarayana",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.dasridraNarayana,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Satabarshiki Utshav Fund",
        subTitle: "କେନ୍ଦ୍ର",
        backgroundColor: NAColor.satabashikiUtshav,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Dinikia Paali",
        subTitle: "Sammilani",
        backgroundColor: NAColor.dinikiaSammilani,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Aabahaka",
        subTitle: "Sammilani",
        backgroundColor: NAColor.abahakaSammilani,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
  ];
}

class Voucher extends StatelessWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Voucher'),
      ),
      body: Container(
        child: Text("Receipt Voucher"),
      ),
    );
  }
}
