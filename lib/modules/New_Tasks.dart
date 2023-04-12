import 'package:flutter/cupertino.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('New Task',
      style: TextStyle(
        fontSize: 20
      ),
      ),
    );
  }
}
