import 'package:flutter/material.dart';
import 'package:nssaccounting/theme/color.dart';
import 'package:nssaccounting/receipt/sm_bhakta_seba_paali.dart';
import 'package:nssaccounting/receipt/ssm_bhakta_seba_paali.dart';
import 'package:nssaccounting/widgetTile.dart';

class WidgetConfig {
  static final List<WidgetTileConfig> ssmWidgetTiles = [
    new WidgetTileConfig(
        widget: SSMBhaktaSebaPaali(),
        title: "Bhakta Seba Paali",
        subTitle: "Satsikhya Mandira",
        backgroundColor: NAColor.ssmBhaktaSebaPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Antebasi Pranaami",
        subTitle: "Satsikhya Mandira",
        backgroundColor: NAColor.ssmAntebasiPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Prasada Pranaami",
        subTitle: "Satsikhya Mandira",
        backgroundColor: NAColor.ssmPrasadPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Paada Pranaami",
        subTitle: "Satsikhya Mandira",
        backgroundColor: NAColor.ssmPadaPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
  ];

  static final List<WidgetTileConfig> smWidgetTiles = [
    new WidgetTileConfig(
        widget: SMBhaktaSebaPaali(),
        title: "Bhakta Seba Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smBhaktaSebaPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Prasada Pranaami",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smPrasadPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Paada Pranaami",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smPadaPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Weekly Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smWeeklyPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Monthly Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smMonthlyPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Quarterly Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smQtrlyPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
  ];

  static final List<WidgetTileConfig> sammilaniWidgetTiles = [
    new WidgetTileConfig(
        widget: SSMBhaktaSebaPaali(),
        title: "Aabahaka",
        subTitle: "Sammilani",
        backgroundColor: NAColor.sammilaniAbahaka,
        crossAxisCellCount: 4,
        mainAxisCellCount: 2),
    new WidgetTileConfig(
        widget: SMBhaktaSebaPaali(),
        title: "Dinikia Paali",
        subTitle: "Sammilani",
        backgroundColor: NAColor.sammilaniDinikia,
        crossAxisCellCount: 4,
        mainAxisCellCount: 2),
  ];

  static final List<WidgetTileConfig> kendraWidgetTiles = [
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Bidyanidhi",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBidyanidhi,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Daridranarayana",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraDaridraNarayana,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Nirvikalpa Siddhisthala",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraNirvikalpa,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Kendra Unnayana",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraUnnayana,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Swastya Seva",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraHealthSeva,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Sthai Nityabhoga",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSthayiNityaBhoga,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Bigraha",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBigraha,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Books",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBooks,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Satabarshiki Utshav Fund",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSatabashikiUtshav,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Gruhasana Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraGruhasanaPranaami,
        crossAxisCellCount: 2,
        mainAxisCellCount: 2),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Agrabhaga",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraAgrabhaga,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Mustivikhya",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraMustivikhya,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Janmoschaba delegate & Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraJanmotschav,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Natural Calamity",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraNaturalCalamity,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Paada Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraPaadaPranaami,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Parichaya Patra",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraParichayaPatra,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Prasaadi Drabya",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraPrasadiDrabya,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Sangha Manjuri",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSanghaManjuri,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Sangha Sebaka",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSanghaSevak,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Bhoga Pranami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBhogaPranaami,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: Voucher(),
        title: "Class Puja Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraClassPuja,
        crossAxisCellCount: 2,
        mainAxisCellCount: 2),
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
