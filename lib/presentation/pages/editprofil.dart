import 'package:flutter/material.dart';
import 'package:posyandu/presentation/pages/profil.dart';
import 'package:posyandu/presentation/widget/theme.dart';

class Editprofil extends StatefulWidget {
  const Editprofil({super.key});

  @override
  State<Editprofil> createState() => _EditprofilState();
}

class _EditprofilState extends State<Editprofil> {
  double containerHeight = 60;
  double containerWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profil()),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: darkblue,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage('assets/images/Pria.jpeg'),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Febsa Maulana Aziz',
                        style: semiboldwhitetext.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Masyarakat Kabupaten Tanggerang',
                        style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(40, 45),
                        ),
                        child: Text(
                          'Ubah Poto Profil',
                          style: mediumWhiteTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 280),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama',
                            style: regularBlackTextStyle.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 5),
                          buildTextField(
                              'Febsa Maulana Aziz', TextInputType.name),
                          const SizedBox(height: 12),
                          Text('Alamat',
                              style:
                                  regularBlackTextStyle.copyWith(fontSize: 12)),
                          const SizedBox(height: 5),
                          buildTextField('Almat lengkap anda',
                              TextInputType.streetAddress),
                          const SizedBox(height: 12),
                          Text('Domisili',
                              style:
                                  regularBlackTextStyle.copyWith(fontSize: 12)),
                          const SizedBox(height: 5),
                          buildTextField('Domisili', TextInputType.name),
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Profil()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(50, 45),
                              ),
                              child: Text(
                                'save',
                                style: mediumWhiteTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //decoration textfield atau container input data
  Widget buildTextField(String hintText, TextInputType inputType,
      {int? maxLength}) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: TextField(
        keyboardType: inputType,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
