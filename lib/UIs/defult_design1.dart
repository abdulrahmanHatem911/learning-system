import 'package:flutter/material.dart';
import 'package:learning/UIs/login1.dart';
import 'package:learning/UIs/signUp1.dart';

class Default1 extends StatelessWidget {
  const Default1({Key? key}) : super(key: key);

  //FirebaseAuth _auth = FirebaseAuth.instance;
  // GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/id.png'),
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'It\'s easier to sign up now',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // SignIn();
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
                    child: ListTile(
                      leading: Image.asset('assets/images/google.png'),
                      title: const Text(
                        'Continue with Gmail',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login1()),
                    );
                  },
                  child: Text(
                    'Use Email or phone',
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    // Image(
                    //   image: AssetImage('assets/images/icons8_Twitter_Circled_48px.png'),
                    //   width: 35,
                    //   height: 35,
                    // ),
                    // Image(
                    //   image: AssetImage('assets/images/google.png'),
                    //   width: 35,
                    //   height: 35,
                    // ),
                    // Image(
                    //   image: AssetImage('assets/images/icons8_LinkedIn_Circled_48px.png'),
                    //   width: 35,
                    //   height: 35,
                    // ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp1()),
                    );
                  },
                  child: Text(
                    'Already have an account! Login',
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> SignIn() async {
  //   GoogleSignInAccount? account = await googleSignIn.signIn();
  //   GoogleSignInAuthentication authentication = await account!.authentication;
  //   // AuthCredential credential =
  //   // GoogleAuthProvider.getCredential(idToken: authentication.idToken,
  //   //     accessToken: authentication.accessToken);
  //   // final user = (await _auth.signInWithCredential(credential)).user;
  //   // if (user != null) {
  //   //   print("${user.email}");
  //   }
}
