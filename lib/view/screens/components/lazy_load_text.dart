import 'package:flutter/material.dart';
import 'package:udemmy5b/view/screens/components/page_transformer.dart';

class LazyLoadText extends StatelessWidget {
  final String text;
  final PageVisibility pageVisibility;

  LazyLoadText({this.text, this.pageVisibility});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.title;
    return Opacity(
      opacity:  pageVisibility.visibleFraction,
      child: Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.translationValues(pageVisibility.pagePosition * 100, 0.0, 0.0),
        child: Text(text, style: textTheme.copyWith(fontWeight:  FontWeight.bold),
        textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
