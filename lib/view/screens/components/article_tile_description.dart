import 'package:flutter/material.dart';
import 'package:udemmy5b/models/model/news_model.dart';
import 'package:udemmy5b/view/screens/style/style.dart';


class ArticleTileDesc extends StatelessWidget {

  final Article article;
  const ArticleTileDesc({this.article});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    var displayDesc = "";
    if(article.description != null){
      displayDesc = article.description;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(article.title.toString(), style: textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 2.0,),
        Text(article.publishData.toString(), style: textTheme.overline.copyWith(
          fontStyle: FontStyle.italic
        ),),
        const SizedBox(height: 2.0,),
        Text(displayDesc, style: textTheme.bodyText1.copyWith(
          fontFamily: RegularFont
        ),)
      ],
    );
  }
}
