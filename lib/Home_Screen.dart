import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Icon(
          Icons.menu,
        ),
        title:Text('app bar title') ,
        actions: [
          IconButton(onPressed: onNotification, icon:Icon(Icons.search) ),


        ],

      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('first',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.cyan,
              backgroundColor: Colors.black12,
            ),
          ),
          Image(image:
          NetworkImage('https://papers.co/wallpaper/papers.co-mx02-bokeh-dark-lights-night-art-simple-flare-35-3840x2160-4k-wallpaper.jpg'),
          fit: BoxFit.cover,
          ),




        ],
      )
      ,
    );

  }

  void onNotification(){
    print('button clicked');
  }

}