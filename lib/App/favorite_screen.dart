import 'package:flutter/material.dart';


class FavouriteScreen extends StatelessWidget {
  final List<dynamic> favouriteList;
  final ThemeData theme;
  const FavouriteScreen({super.key, required this.favouriteList, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
              onPressed: () {
                Navigator.pop(context, favouriteList);
              },
              icon: Icon(Icons.arrow_back, color: theme.colorScheme.secondary,)),
        
        title: Text("Favourite", style: TextStyle(color: theme.colorScheme.secondary),),
        backgroundColor: theme.colorScheme.primary,),
      body: Center(
        child: ListView.builder(
            itemCount: favouriteList.length,
            itemBuilder: (context, i) {
              final post = favouriteList[i];
              var image = post;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Image.network(image["small"])
                  
                ],
              );
            }),
      ),
    ),);
  }
}