import 'package:flutter/material.dart';
import 'package:posyandu/presentation/pages/editprofil.dart';
import 'package:posyandu/presentation/pages/home.dart';
import 'package:posyandu/presentation/pages/login.dart';
import 'package:posyandu/presentation/widget/theme.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final int _selectedIndex = 1; // Set default to Home

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Profil()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    const CircleAvatar(
                      foregroundImage: AssetImage('assets/images/Pria.jpeg'),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Text(
                      'Febsa Maulana Aziz',
                      style: semiboldwhitetext.copyWith(fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Editprofil()),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const Icon(Icons.mode_edit_outline_outlined),
                            const SizedBox(width: 25),
                            Text(
                              'Edit Profil',
                              style:
                                  mediumBlackTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(width: 135),
                            const Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 25),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 55,
                  //     width: 350,
                  //     decoration: BoxDecoration(
                  //         color: Colors.teal[200],
                  //         borderRadius: BorderRadius.circular(18)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 25),
                  //       child: Row(
                  //         children: [
                  //           const Icon(Icons.info_outline),
                  //           const SizedBox(width: 20),
                  //           Text(
                  //             'Tentang Kami',
                  //             style:
                  //                 mediumBlackTextStyle.copyWith(fontSize: 18),
                  //           ),
                  //           const SizedBox(width: 95),
                  //           const Icon(Icons.arrow_forward_ios_outlined)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 25),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 55,
                  //     width: 350,
                  //     decoration: BoxDecoration(
                  //         color: Colors.teal[200],
                  //         borderRadius: BorderRadius.circular(18)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 25),
                  //       child: Row(
                  //         children: [
                  //           const Icon(Icons.settings_outlined),
                  //           const SizedBox(width: 20),
                  //           Text(
                  //             'Pengaturan',
                  //             style:
                  //                 mediumBlackTextStyle.copyWith(fontSize: 18),
                  //           ),
                  //           const SizedBox(width: 115),
                  //           const Icon(Icons.arrow_forward_ios_outlined)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              'Keluar',
                              style:
                                  mediumBlackTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(width: 210),
                            const Icon(Icons.logout_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          backgroundColor: darkblue,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
