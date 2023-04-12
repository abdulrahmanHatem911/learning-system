import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MassengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blue,
    appBar:AppBar (
      titleSpacing: 20,
      elevation: 0.0,
      backgroundColor: Colors.blue,
      title: Row(children: [
        CircleAvatar(
          backgroundImage:NetworkImage('https://papers.co/wallpaper/papers.co-mx02-bokeh-dark-lights-night-art-simple-flare-35-3840x2160-4k-wallpaper.jpg'),
          radius: 20.0,
        ),
        SizedBox(width: 10.0,),
        Text('Chats',
        style: TextStyle(
          color: Colors.black26,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        ),
      ],
      ),
      actions: [
        CircleAvatar(
        backgroundColor: Colors.white70,
        radius: 15.0 ,
        child: IconButton(onPressed: (){},icon: Icon(Icons.camera_alt),iconSize: 15,
        ),
        ),
        CircleAvatar(
        backgroundColor: Colors.white70,
        radius: 15.0 ,
        child: IconButton(onPressed: (){},icon: Icon(Icons.edit),iconSize: 15,
        ),
        ),
      ],
    ) ,
    body:Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                Text('Search',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black12
                ),)
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 60,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:NetworkImage('https://papers.co/wallpaper/papers.co-mx02-bokeh-dark-lights-night-art-simple-flare-35-3840x2160-4k-wallpaper.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: 3,
                              end: 3,
                            ),
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 10,),
                      Text('Mohamed Ahmed',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:NetworkImage('https://papers.co/wallpaper/papers.co-mx02-bokeh-dark-lights-night-art-simple-flare-35-3840x2160-4k-wallpaper.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: 3,
                              end: 3,
                            ),
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 10,),
                      Text('Mohamed Ahmed',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
                SizedBox(width: 7,),
                Container(
                  width: 60,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:NetworkImage('https://papers.co/wallpaper/papers.co-mx02-bokeh-dark-lights-night-art-simple-flare-35-3840x2160-4k-wallpaper.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: 3,
                              end: 3,
                            ),
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 10,),
                      Text('Mohamed Ahmed',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    ),
    );
  }
}
