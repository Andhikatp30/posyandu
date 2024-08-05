import 'package:flutter/material.dart';
import 'package:posyandu/presentation/pages/home.dart';
import 'package:posyandu/presentation/pages/signup.dart';
import 'package:posyandu/presentation/widget/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: non_constant_identifier_names
  bool _ObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95),
                bottomRight: Radius.circular(95),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login',
                      style: semiboldwhitetext.copyWith(fontSize: 22),
                    ),
                  ),
                  Image.asset('assets/images/sp2.png'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  textAlign: TextAlign.left,
                  style: regularBlackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 12),
                // ignore: avoid_unnecessary_containers
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Contoh: budi@gmail.com',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: regularBlackTextStyle.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 12),
                // ignore: avoid_unnecessary_containers
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan password',
                      filled: false,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_ObsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _ObsecureText = !_ObsecureText;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    obscureText: _ObsecureText,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      elevation: 4,
                      shadowColor: Colors.black,
                      backgroundColor: Colors.purple,
                      minimumSize: const Size.fromHeight(45)),
                  child: Text(
                    "Masuk",
                    textAlign: TextAlign.center,
                    style: semiboldwhitetext.copyWith(fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Apakah kamu sudah memiliki akun Rumah Kita?",
                      textAlign: TextAlign.center,
                      style: regularBlackTextStyle.copyWith(fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: Text(
                        "Daftar",
                        textAlign: TextAlign.center,
                        style: regularBlackTextStyle.copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
