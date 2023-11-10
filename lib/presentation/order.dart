import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:foodivoire/src/shared/utils/images.dart';
import 'package:provider/provider.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List<String> selectedOptions = [];

  List<String> options = ['Sans sel', 'épicé', 'Gras'];

  void onOptionSelected(String option) {
    if (selectedOptions.contains(option)) {
      setState(() {
        selectedOptions.remove(option);
      });
    } else {
      setState(() {
        selectedOptions.add(option);
      });
    }
  }

  int qty = 0;

  void add() {
    setState(() {
      qty++;
    });
  }

  void remove() {
    if (qty > 1) {
      setState(() {
        qty--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        foregroundColor: black,
        backgroundColor: white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .3,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(CustomImages.fd1),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              const Text(
                "Aloco poulet",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageProvider.isEnglish ? 'Vendor' : "Vendeur :",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Text(
                        languageProvider.isEnglish
                            ? 'Quantity :'
                            : "Quantité :",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Text(
                        languageProvider.isEnglish
                            ? 'Supplement :'
                            : "Suplément :",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Text(
                        languageProvider.isEnglish ? 'Price :' : "Prix :",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Text(
                        languageProvider.isEnglish
                            ? 'Cooking time :'
                            : "Temps de cuisson :",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Text(
                          languageProvider.isEnglish
                              ? "Delivery"
                              : "Livraison :",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Miss Zahui",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: remove,
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.03,
                              width: MediaQuery.sizeOf(context).width * .06,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: black)),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.02,
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                            width: MediaQuery.sizeOf(context).width * .06,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: black)),
                            child: Center(
                              child: Text(
                                "$qty",
                                style: const TextStyle(
                                  color: black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.02,
                          ),
                          GestureDetector(
                            onTap: add,
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.03,
                              width: MediaQuery.sizeOf(context).width * .06,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: black)),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        width: MediaQuery.sizeOf(context).width * .06,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: black)),
                        child: const Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        width: MediaQuery.sizeOf(context).width * .25,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: black)),
                        child: const Center(
                          child: Text(
                            "45 000 FCFA",
                            style: TextStyle(
                              color: black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      const Text(
                        "30 min",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      const Text(
                        "Dans 15 min",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              for (String option in options)
                Row(
                  children: [
                    Checkbox(
                      activeColor: green,
                      value: selectedOptions.contains(option),
                      onChanged: (bool? value) {
                        onOptionSelected(option);
                      },
                    ),
                    Text(option),
                  ],
                ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(green)),
                    child: Text(
                        languageProvider.isEnglish ? 'CONFIRM' : "VALIDER"),
                  ),
                  Text(languageProvider.isEnglish ? "ON PLACE" : "SUR PLACE",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: green, fontSize: 17))
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
