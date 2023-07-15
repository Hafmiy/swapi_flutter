import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget>{

  List<Widget> packageToSliver() => map((e) => SliverToBoxAdapter(child: e)).toList();

  List<Widget> divide({required Widget divider}) {
    return [
      for(int i = 0; i < length*2 - 1; i ++)
        if(i.isOdd)
          divider
        else
          this[i~/2]
    ];
  }
}
