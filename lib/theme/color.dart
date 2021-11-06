import 'package:flutter/material.dart';

class NAColor {
  static Color ssmBhaktaSebaPaali = Color(0xFFfff9e9);
  static Color ssmAntebasiPranaami = Color(0xFFfff7f5);
  static Color ssmPrasadPranaami = Color(0xFFeefbff);
  static Color ssmPadaPranaami = Color(0xFFF4EFFE);

  static Color smBhaktaSebaPaali = Color(0xFFfff9e9);
  static Color smPrasadPranaami = Color(0xFFeefbff);
  static Color smPadaPranaami = Color(0xFFF4EFFE);
  static Color smWeeklyPaali = Color(0xFFefffee);
  static Color smMonthlyPaali = Color(0xFFeef1ff);
  static Color smQtrlyPaali = Color(0xFFffeeee);

  static Color sammilaniDinikia = Color(0xFFfffaee);
  static Color sammilaniAbahaka = Color(0xFFf9ffee);

  static Color kendraBidyanidhi = Color(0xFFeefffb);
  static Color kendraHealthSeva = Color(0xFFeef9ff);
  static Color kendraSthayiNityaBhoga = Color(0xFFf2eeff);
  static Color kendraDaridraNarayana = Color(0xFFfeeeff);
  static Color kendraSatabashikiUtshav = Color(0xFFfff7ee);
  static Color kendraNirvikalpa = Color(0xFFeef7ff);
  static Color kendraUnnayana = Color(0xFFffeef8);
  static Color kendraBooks = Color(0xFFeeffef);
  static Color kendraBigraha = Color(0xFFfff3ee);
  static Color kendraGruhasanaPranaami = Color(0xFFf7ffd9);
  static Color kendraAgrabhaga = Color(0xFFd9ffc2);
  static Color kendraMustivikhya = Color(0xFFc2feff);
  static Color kendraJanmotschav = Color(0xFFc2d6ff);
  static Color kendraNaturalCalamity = Color(0xFFffc2c2);
  static Color kendraPaadaPranaami = Color(0xFFf5f5ff);
  static Color kendraParichayaPatra = Color(0xFFfff5f7);
  static Color kendraPrasadiDrabya = Color(0xFFfffff5);
  static Color kendraSanghaManjuri = Color(0xFFfafff5);
  static Color kendraSanghaSevak = Color(0xFFfff9f5);
  static Color kendraBhogaPranaami = Color(0xFFf5ffff);
  static Color kendraClassPuja = Color(0xFFf9f5ff);

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
