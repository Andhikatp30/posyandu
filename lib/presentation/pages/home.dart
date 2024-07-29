import 'package:flutter/material.dart';
import 'package:posyandu/data/models/layanan_models.dart';
import 'package:posyandu/presentation/pages/notifikasi.dart';
import 'package:posyandu/presentation/pages/profil.dart';
import 'package:posyandu/presentation/widget/listlayanan.dart';
import 'package:posyandu/presentation/widget/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Surat> layananSurat = [
    Surat(name: 'Imunisasi & Vitamin'),
    Surat(name: 'Timbang Balita & Anak'),
    Surat(name: 'Ibu Hamil'),
  ];

  final int _selectedIndex = 0; // Set default to Home

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
        appBar: AppBar(
          title: Row(
            children: [
              const CircleAvatar(
                foregroundImage: AssetImage('assets/images/Pria.jpeg'),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Febsa Maulana Aziz',
                    style: mediumPURPLETextStyle.copyWith(fontSize: 20),
                  ),
                  Text(
                    'Ajukan keluhan anda bersama kami',
                    style: regularBlackTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 205, 249, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Notifikasi(),
                        ));
                  },
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.indigo,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 355,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              foregroundImage:
                                  AssetImage('assets/images/Pria.jpeg'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Zidan Aryanta Dinata \n 6 Bulan',
                              style:
                                  mediumPURPLETextStyle.copyWith(fontSize: 20),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const LinearProgressIndicator(
                          value: 0.5,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 4,
                            shadowColor: Colors.black,
                            backgroundColor: Colors.purple,
                            minimumSize: const Size.fromHeight(35),
                          ),
                          child: Text(
                            "Masuk",
                            textAlign: TextAlign.center,
                            style: semiboldwhitetext.copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Layanan',
                  style: mediumPURPLETextStyle.copyWith(fontSize: 15),
                ),
                const Divider(),
                Listlayanan(
                  layananSurat: layanansurat,
                ),
              ],
            ),
          ),
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
