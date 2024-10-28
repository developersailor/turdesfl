import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
    this.separatorBuilder,
    this.isSeparated = false,
    this.isBuilder = true,
    this.isExtended = false,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
  });
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool isSeparated;
  final bool isBuilder;
  final bool isExtended;
  final ScrollController? controller;
  final Axis scrollDirection;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    if (isSeparated && separatorBuilder != null) {
      return ListView.separated(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder!,
        controller: controller,
        scrollDirection: scrollDirection,
        reverse: reverse,
      );
    } else if (isBuilder) {
      return ListView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        controller: controller,
        scrollDirection: scrollDirection,
        reverse: reverse,
      );
    } else if (isExtended) {
      return ListView(
        controller: controller,
        scrollDirection: scrollDirection,
        reverse: reverse,
        children:
            List.generate(itemCount, (index) => itemBuilder(context, index)),
      );
    } else {
      return ListView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        controller: controller,
        scrollDirection: scrollDirection,
        reverse: reverse,
      );
    }
  }
}
