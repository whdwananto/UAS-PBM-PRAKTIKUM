import 'package:flutter/material.dart';
import 'package:projectuas/Page/listproduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

Widget buildEmail() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      'Email',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 10),
    Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 15),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff5ac18e),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black87)),
      ),
    )
  ]);
}

class _LoginPageState extends State<LoginPage> {
  bool visibletext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 120,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildEmail(),
                const SizedBox(height: 20),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    child: TextField(
                      obscureText: visibletext,
                      style: TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 15),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff5ac18e),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibletext = !visibletext;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                  )
                ]),
                LoginButton(),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 25),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            // ignore: use_build_context_synchronously
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: const Text(
            'Login',
            style: TextStyle(
                color: Color(0xff5ac18e),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
