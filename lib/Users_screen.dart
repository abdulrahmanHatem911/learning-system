import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userModel{
  final String phone;
  final String name;
  final int id;

  userModel({
    @required this.phone='',
    @required this.name='',
    @required this.id=0,
});
}
class UserScreen extends StatelessWidget {
  List<userModel> Users =[
    userModel(
      id: 5,
      phone: '01118608080',
      name: 'mohamed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body:ListView.separated(
          itemBuilder: (context, index) => BuildUserItem(Users[index]),
          separatorBuilder: (context, index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.black26,
            ),
          ),
          itemCount: Users.length) ,
    );
  }
  Widget BuildUserItem(userModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Text('${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.cyan,
        ),
        SizedBox(width: 20,),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${user.phone}',
              style:TextStyle(
                color: Colors.grey,
              ),)
          ],
        )
      ],
    ),
  );
}
