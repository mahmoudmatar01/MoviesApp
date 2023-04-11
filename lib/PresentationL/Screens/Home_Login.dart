import 'package:flutter/material.dart';
import 'package:moviesapp/PresentationL/Controllers/Login_Controller.dart';
import 'package:moviesapp/PresentationL/Screens/Reister_Page.dart';

class HomeLogin extends StatefulWidget {
  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  String? email;
  String? password;
  bool obsucre = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .4,
              child: Image.asset(
                "images/logo.png",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cinema Ticket",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .035,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                Text(
                  "Your Tagline Here",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .03,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: TextFormField(
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Email",
                      label: Text("Email....")),
                )),
            Container(
              height: 60,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                onChanged: (val) {
                  password = val;
                },
                obscureText: obsucre,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: obsucre
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                      onPressed: () {
                        setState(() {
                          obsucre = !obsucre;
                        });
                      },
                    ),
                    hintText: "Password",
                    label: const Text("Password")),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "if Your haven't an Account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child: Text("Click here"))
              ],
            ),
            InkWell(
              onTap: () async {
                await LoginController().loginMethod(email!, password!);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * .06,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
