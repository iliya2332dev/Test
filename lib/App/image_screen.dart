
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final dynamic imageUrl;
  final ThemeData theme;
  final List<dynamic> favouriteList;
  const ImageScreen({
    Key? key,
    required this.imageUrl,
    required this.theme,
    required this.favouriteList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, favouriteList);
              },
              icon:  Icon(Icons.arrow_back, color: theme.colorScheme.secondary,)),
              actions: [
                IconButton(onPressed: () {
                  favouriteList.add(imageUrl["urls"]);
                  print(favouriteList);
                }, icon:  Icon(Icons.star, color: theme.colorScheme.secondary,))
              ],
        ),
        body: 
        Center(
          child: ListView(children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(imageUrl["urls"]["full"]),
               
            ],
          ),
          ],)
          ),
      ),
    );
  }
}

