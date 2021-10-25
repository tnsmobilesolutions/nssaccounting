import 'package:flutter/widgets.dart';

class WidgetTileConfig {
  final Widget widget;
  final String title;
  final String subTitle;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final Color backgroundColor;
  WidgetTileConfig({
    required this.widget,
    required this.title,
    required this.subTitle,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.backgroundColor,
  });

  WidgetTileConfig copyWith({
    Widget? widget,
    String? title,
    String? subTitle,
    int? crossAxisCellCount,
    int? mainAxisCellCount,
    Color? backgroundColor,
  }) {
    return WidgetTileConfig(
      widget: widget ?? this.widget,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      crossAxisCellCount: crossAxisCellCount ?? this.crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount ?? this.mainAxisCellCount,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  String toString() {
    return 'WidgetTile(widget: $widget, title: $title, subTitle: $subTitle, crossAxisCellCount: $crossAxisCellCount, mainAxisCellCount: $mainAxisCellCount, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WidgetTileConfig &&
        other.widget == widget &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.crossAxisCellCount == crossAxisCellCount &&
        other.mainAxisCellCount == mainAxisCellCount &&
        other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode {
    return widget.hashCode ^
        title.hashCode ^
        subTitle.hashCode ^
        crossAxisCellCount.hashCode ^
        mainAxisCellCount.hashCode ^
        backgroundColor.hashCode;
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'widget': widget.toMap(),
  //     'title': title,
  //     'subTitle': subTitle,
  //     'crossAxisCellCount': crossAxisCellCount,
  //     'mainAxisCellCount': mainAxisCellCount,
  //     'backgroundColor': backgroundColor.value,
  //   };
  // }

  // factory WidgetTile.fromMap(Map<String, dynamic> map) {
  //   return WidgetTile(
  //     widget: Widget.fromMap(map['widget']),
  //     title: map['title'],
  //     subTitle: map['subTitle'],
  //     crossAxisCellCount: map['crossAxisCellCount'],
  //     mainAxisCellCount: map['mainAxisCellCount'],
  //     backgroundColor: Color(map['backgroundColor']),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory WidgetTile.fromJson(String source) => WidgetTile.fromMap(json.decode(source));
}
