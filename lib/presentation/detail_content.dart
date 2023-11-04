import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/presentation/vendor_detail.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int isSelected1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text(
          "Resraurant specialise dans la nourriture africaine, Chez Miss Zahoui vous pourrez toujours deguster les meilleurs plats d'attieke poisson au monde. Du sosso au loss en passant par les carpes, nous vous offrons un large choix de poissons frais."),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * .02,
      ),
      ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
          shrinkWrap: true,
          itemCount: popularVendors.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final vendor = popularVendors[index];
            final img = vendor["image"];
            final name = vendor["name"];
            final distance = vendor["distance"];

            return PopularVendors(
                image: img,
                name: name,
                distance: distance,
                index: index,
                isSelectedIndex: isSelected1,
                onTap: () {
                  setState(() {
                    isSelected1 = index;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const VendorDetailView();
                      },
                    ));
                  });
                });
          }),
    ]));
  }
}
