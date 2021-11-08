import 'package:flutter/material.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/Kendra_paaada_pranaami.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/Kendra_parichaya_patra.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/Kendra_prasaadi_drabya.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_agrabhaga.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_bhoga_pranaami.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_bidyanidhi.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_bigraha.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_book.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_daridranarayana.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_gruhasana_pranaami.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_janmoschaba%20delegate.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_mustivikhya.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_natural_calamity.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_nirvikalpa_siddhisthala.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_sangha_manjuri.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_sangha_sebika.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_satabarshiki_utshav.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_satsikhya_pranaami.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_sthai_nityabhoga.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_swastya_seva.dart';
import 'package:nssaccounting/receipt/Kendra_Receipts/kendra_unnayana.dart';
import 'package:nssaccounting/receipt/SM_Receipts/sm_bhakta_seba_paali.dart';
import 'package:nssaccounting/receipt/SM_Receipts/sm_monthly_paali.dart';
import 'package:nssaccounting/receipt/SM_Receipts/sm_paada_pranaami.dart';
import 'package:nssaccounting/receipt/SM_Receipts/sm_prasada_pranaami.dart';
import 'package:nssaccounting/receipt/SM_Receipts/sm_quaterly_paali.dart';
import 'package:nssaccounting/receipt/SM_Receipts/sm_weekly_paali.dart';
import 'package:nssaccounting/receipt/SSM_Receipts/ssm_antebasi_pranaami.dart';
import 'package:nssaccounting/receipt/SSM_Receipts/ssm_paada_pranaami.dart';
import 'package:nssaccounting/receipt/SSM_Receipts/ssm_prasad_pranaami.dart';
import 'package:nssaccounting/receipt/Samilani_Receipts/sammilani_aabahaka.dart';
import 'package:nssaccounting/receipt/Samilani_Receipts/sammilani_dinikia_paali.dart';
import 'package:nssaccounting/theme/color.dart';
import 'package:nssaccounting/widgetTile.dart';

import 'receipt/SSM_Receipts/ssm_bhakta_seba_paali.dart';

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
        widget: SSMAntebasiPranaami(),
        title: "Antebasi Pranaami",
        subTitle: "Satsikhya Mandira",
        backgroundColor: NAColor.ssmAntebasiPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SSMPrasadPranaami(),
        title: "Prasada Pranaami",
        subTitle: "Satsikhya Mandira",
        backgroundColor: NAColor.ssmPrasadPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SSMPaadaPranaami(),
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
        widget: SMPrasadaPranaami(),
        title: "Prasada Pranaami",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smPrasadPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SMPaadaPranaami(),
        title: "Paada Pranaami",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smPadaPranaami,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SMWeeklyPaali(),
        title: "Weekly Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smWeeklyPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SMMonthlyPaali(),
        title: "Monthly Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smMonthlyPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: SMQuaterlyPaali(),
        title: "Quarterly Paali",
        subTitle: "Smruti Mandira",
        backgroundColor: NAColor.smQtrlyPaali,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
  ];

  static final List<WidgetTileConfig> sammilaniWidgetTiles = [
    new WidgetTileConfig(
        widget: SammilaniAabahaka(),
        title: "Aabahaka",
        subTitle: "Sammilani",
        backgroundColor: NAColor.sammilaniAbahaka,
        crossAxisCellCount: 4,
        mainAxisCellCount: 2),
    new WidgetTileConfig(
        widget: SammilaniDinikiaPaali(),
        title: "Dinikia Paali",
        subTitle: "Sammilani",
        backgroundColor: NAColor.sammilaniDinikia,
        crossAxisCellCount: 4,
        mainAxisCellCount: 2),
  ];

  static final List<WidgetTileConfig> kendraWidgetTiles = [
    new WidgetTileConfig(
        widget: KendraBidyanidhi(),
        title: "Bidyanidhi",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBidyanidhi,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraDaridraNarayana(),
        title: "Daridranarayana",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraDaridraNarayana,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraNirvikalpaSiddhisthala(),
        title: "Nirvikalpa Siddhisthala",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraNirvikalpa,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraUnnayana(),
        title: "Kendra Unnayana",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraUnnayana,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraSwastyaSeva(),
        title: "Swastya Seva",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraHealthSeva,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraSthaiNityabhoga(),
        title: "Sthai Nityabhoga",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSthayiNityaBhoga,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraBigraha(),
        title: "Bigraha",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBigraha,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraBook(),
        title: "Books",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBooks,
        crossAxisCellCount: 1,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraSatabarshikiUtshav(),
        title: "Satabarshiki Utshav Fund",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSatabashikiUtshav,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraGruhasanaPranaami(),
        title: "Gruhasana Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraGruhasanaPranaami,
        crossAxisCellCount: 2,
        mainAxisCellCount: 2),
    new WidgetTileConfig(
        widget: KendraAgrabhaga(),
        title: "Agrabhaga",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraAgrabhaga,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraMustivikhya(),
        title: "Mustivikhya",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraMustivikhya,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraJanmoschabaDelegate(),
        title: "Janmoschaba delegate & Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraJanmotschav,
        crossAxisCellCount: 4,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraNaturalCalamity(),
        title: "Natural Calamity",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraNaturalCalamity,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraPaadaPranaami(),
        title: "Paada Pranaami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraPaadaPranaami,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraParichayaPatra(),
        title: "Parichaya Patra",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraParichayaPatra,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraPrasaadiDrabya(),
        title: "Prasaadi Drabya",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraPrasadiDrabya,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraSanghaManjiuri(),
        title: "Sangha Manjuri",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSanghaManjuri,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraSanghaSebika(),
        title: "Sangha Sebaka",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraSanghaSevak,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraBhogaPranaami(),
        title: "Bhoga Pranami",
        subTitle: "Kendra",
        backgroundColor: NAColor.kendraBhogaPranaami,
        crossAxisCellCount: 2,
        mainAxisCellCount: 1),
    new WidgetTileConfig(
        widget: KendraSatsikhyaPranaami(),
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
