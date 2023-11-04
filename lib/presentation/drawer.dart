import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
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
                            fontWeight: FontWeight.w500, fontSize: 17),
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
                        const Text('Evenement', style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.contacts_outlined, size: 20),
                    title: const Text('Nous contactez',
                        style: TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  // ListTile(
                  //   leading: const Icon(Icons.share, size: 20),
                  //   title: const Text('Share',
                  //       style: TextStyle(fontSize: 17)),
                  //   onTap: () {},
                  // ),
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
                const Text(
                  "Déconnection",
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
