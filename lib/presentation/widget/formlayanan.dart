import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/data/models/layanan_models.dart';
import 'package:posyandu/presentation/pages/home.dart';
import 'package:posyandu/presentation/pages/profil.dart';
import 'package:posyandu/presentation/widget/theme.dart';

class Inputlayanan extends StatefulWidget {
  const Inputlayanan({super.key, required this.selectedSurat});
  final Surat selectedSurat;

  @override
  State<Inputlayanan> createState() => _InputlayananState();
}

class _InputlayananState extends State<Inputlayanan> {
  double containerHeight = 60.0;
  double containerWidth = double.infinity;

  DateTime? _selectedDate;
  final DateFormat formatter =
      DateFormat('dd/MM/yyyy'); // Inisialisasi formatter

  // Status untuk tombol gender
  String _selectedGender = '';

  void _presentStartDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 10, now.month, now.day);
    final lastDate = DateTime(now.year + 5, now.month, now.day);
    final pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickDate;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.selectedSurat.name,
            style: semibolddeepblueextStyle.copyWith(fontSize: 14)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: deepblueColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInputSection('Nama', 'Masukan Nama', TextInputType.text),
              const SizedBox(height: 16),
              buildInputSection('Umur', 'Masukan umur', TextInputType.number),
              const SizedBox(height: 16),
              buildInputSection(
                  'Tanggal', 'Masukan tanggal', TextInputType.datetime,
                  isDate: true),
              const SizedBox(height: 16),
              buildInputSection(
                  'Berat Badan', 'Masukan berat badan', TextInputType.number),
              const SizedBox(height: 16),
              buildInputSection(
                  'Keluhan', 'Masukan keluhan disini', TextInputType.text),
              const SizedBox(height: 16),
              const Text('Jenis Kelamin', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: buildGenderButton('Laki - Laki'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: buildGenderButton('Perempuan'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: "Success",
                      desc: "Data berhasil disimpan",
                      btnOkOnPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                    ).show();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    iconColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
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
    );
  }

  Widget buildInputSection(
      String label, String hintText, TextInputType inputType,
      {bool isDate = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        isDate ? buildDatePicker() : buildTextField(hintText, inputType),
      ],
    );
  }

  Widget buildTextField(String hintText, TextInputType inputType) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildDatePicker() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _selectedDate == null
                ? 'Masukan tanggal'
                : formatter.format(_selectedDate!),
            style: const TextStyle(color: Colors.black54),
          ),
          IconButton(
            onPressed: _presentStartDatePicker,
            icon: const Icon(Icons.calendar_today, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget buildGenderButton(String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedGender = text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedGender == text ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 16,
              color: _selectedGender == text ? Colors.white : Colors.black)),
    );
  }
}
