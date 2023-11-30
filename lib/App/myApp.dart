
// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/App/favorite_screen.dart';
import 'package:test_app/App/image_screen.dart';
import 'package:test_app/theme/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url =
      'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  var _postJson = [];

  void fetchPost() async {
    final request = await get(Uri.parse(url));
    final responce = jsonDecode(request.body) as List;

    setState(() {
      _postJson = responce;
    });
  }

  var favouriteList = [];

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title:  Text('Flutter App', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          actions: [Row(
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                                builder: (context) => FavouriteScreen(
                                      favouriteList: favouriteList,
                                      theme: Provider.of<ThemeProvider>(context).themeData
                                    )));
              }, 
              icon:  Icon(Icons.star, color: Theme.of(context).colorScheme.secondary,)),
              IconButton(onPressed: (){
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              }, 
              icon:  Icon(Icons.sunny, color: Theme.of(context).colorScheme.secondary,))
            ],
          )],
        ),
        body: ListView.builder(
            itemCount: _postJson.length,
            itemBuilder: (context, i) {
              final post = _postJson[i];
              var image = post["urls"]["small"];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageScreen(
                                      imageUrl: post,
                                      favouriteList: favouriteList,
                                      theme: Provider.of<ThemeProvider>(context).themeData,
                                    )));
                      },
                      icon: Image.network(image)),
                  Text('${post["user"]["name"]}'),
                ],
              );
            }),
      ),
    );
  }
}