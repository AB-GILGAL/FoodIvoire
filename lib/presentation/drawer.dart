import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:share_plus/share_plus.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Drawer(
      width: MediaQuery.sizeOf(context).width * .8,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .05,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .02,
                ),
                const Text(
                  "MENU",
                  style:
                      TextStyle(letterSpacing: 3, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "assets/images/ab.png",
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .05,
                      ),
                      const Text(
                        "Jojoo McSam",
                        style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  const Divider(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart_outlined, size: 25),
                    title: const Text('Mes commandes',
                        style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_outlined, size: 25),
                    title: const Text('Notification',
                        style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.card_giftcard_outlined, size: 25),
                    title: const Text('Codes Promo',
                        style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.file_open_outlined, size: 25),
                    title: const Text('Blog', style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.event, size: 25),
                    title:
                         Text(
                          languageProvider.isEnglish
                  ? "Event"
                  : "Evenement",
                 style: const TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.contacts_outlined, size: 20),
                    title: const Text('Nous contactez',
                        style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.share, size: 20),
                    title: const Text('Share App',
                        style: TextStyle(fontSize: 17)),
                    onTap: ()async => await Share.share("Check out the amazing Food Delivery App. "
                    "https://play.google.com/store/apps/details?id=com.drivncustomer.drivn_customer."
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  const Divider(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .05,
            ),
            Row(
              children: [
                const Icon(
                  Icons.logout_outlined,
                  size: 25,
                  color: Colors.red,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .02,
                ),
                Text(
                  languageProvider.isEnglish
                  ? "LogOut"
                  : "Déconnection",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
