import 'package:flutter/material.dart';
import 'package:posyandu/data/models/layanan_models.dart';
import 'package:posyandu/presentation/widget/formlayanan.dart';
import 'package:posyandu/presentation/widget/theme.dart';

class Listlayanan extends StatelessWidget {
  const Listlayanan({super.key, required this.layananSurat});
  final List<Surat> layananSurat;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: layananSurat.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Inputlayanan(
                selectedSurat: layananSurat[index], // Kirim data yang dipilih
              ),
            ),
          );
        },
        
        child: Card(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Image.asset('assets/images/surat.png'),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pelayanan Posyandu Angrek 1',
                        style: regularwhitetext.copyWith(fontSize: 12)),
                    Text(
                      layananSurat[index].name,
                      style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
