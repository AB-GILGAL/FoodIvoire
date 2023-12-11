// import 'package:flutter/material.dart';
// import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// // import 'package:share_plus/share_plus.dart';

// class DrawerView extends StatelessWidget {
//   const DrawerView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final languageProvider = Provider.of<LanguageProvider>(context);
//     return Drawer(
//       width: MediaQuery.sizeOf(context).width * .8,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .05,
//             ),
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Icon(
//                     Icons.close,
//                     size: 25,
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.sizeOf(context).width * .02,
//                 ),
//                 const Text(
//                   "MENU",
//                   style:
//                       TextStyle(letterSpacing: 3, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.sizeOf(context).height * .04,
//                   ),
//                   Row(
//                     children: [
//                       const CircleAvatar(
//                         radius: 25,
//                         backgroundImage: AssetImage(
//                           "assets/images/ab.png",
//                         ),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.sizeOf(context).width * .05,
//                       ),
//                       const Text(
//                         "Jojoo McSam",
//                         style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                   ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: MediaQuery.sizeOf(context).height * .04,
//                   ),
//                   const Divider(
//                     height: 2,
//                   ),
//                   SizedBox(
//                     height: MediaQuery.sizeOf(context).height * .05,
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.shopping_cart_outlined, size: 25),
//                     title: const Text('Mes commandes',
//                         style: TextStyle(fontSize: 17)),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.notifications_outlined, size: 25),
//                     title: const Text('Notification',
//                         style: TextStyle(fontSize: 17)),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.card_giftcard_outlined, size: 25),
//                     title: const Text('Codes Promo',
//                         style: TextStyle(fontSize: 17)),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.file_open_outlined, size: 25),
//                     title: const Text('Blog', style: TextStyle(fontSize: 17)),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.event, size: 25),
//                     title:
//                          Text(
//                           languageProvider.isEnglish
//                   ? "Event"
//                   : "Evenement",
//                  style: const TextStyle(fontSize: 17)),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.contacts_outlined, size: 20),
//                     title: const Text('Nous contactez',
//                         style: TextStyle(fontSize: 17)),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.share, size: 20),
//                     title: const Text('Share App',
//                         style: TextStyle(fontSize: 17)),
//                     onTap: ()async => await Share.share("Check out the amazing Food Delivery App. "
//                     "https://play.google.com/store/apps/details?id=com.drivncustomer.drivn_customer."
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.sizeOf(context).height * .05,
//                   ),
//                   const Divider(),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * .05,
//             ),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.logout_outlined,
//                   size: 25,
//                   color: Colors.red,
//                 ),
//                 SizedBox(
//                   width: MediaQuery.sizeOf(context).width * .02,
//                 ),
//                 Text(
//                   languageProvider.isEnglish
//                   ? "LogOut"
//                   : "Déconnection",
//                   style: const TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodivoire/src/feature/auth/data/api/api_service.dart';
import 'package:foodivoire/src/feature/auth/presentation/view/otp_request_view.dart';
import 'package:foodivoire/src/feature/language/presentation/provider/lang_provider.dart';
import 'package:foodivoire/src/feature/menu/data/api/api_service.dart';
import 'package:foodivoire/src/shared/constant/base_url.dart';
// import 'package:foodivoire/src/shared/constant/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  static String? img = "";

  // Method to make a PUT request to update the profile image
 Future<void> updateProfileImage(String imageUrl) async {
  const apiUrl = "$baseUrl/auth/update-avatar";

  try {
    var request = http.MultipartRequest('PUT', Uri.parse(apiUrl))

     ..files.add(await http.MultipartFile.fromPath('avatar', imageUrl) );

    var response = await client.sendMultipartRequest(request: request);

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      print("Profile image updated successfully");
    } else {
      print("Failed to update profile image. Status code: ${response.statusCode}");
    }
  } catch (error) {
    print("Error updating profile image: $error");
  }
}


  // Method to open the file picker and get the selected image
  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Update the profile image after selecting an image
      await updateProfileImage(pickedFile.path);

      // Show a SnackBar or any other UI feedback to inform the user
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile image updated successfully"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _openWhatsAppChat(String phoneNumber) async {
    final whatsappUrl = "https://wa.me/$phoneNumber";
    launchUrl(Uri.parse(whatsappUrl));
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    // Assume you have an API endpoint that provides the URL for the updated image

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
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            // Use a default image or placeholder while the user hasn't selected an image
                            backgroundImage: NetworkImage(""),
                          ),
                          InkWell(
                              onTap: () {
                                _pickImage(context);
                              },
                              child: const Icon(Icons.edit))
                        ],
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
                    title: Text(
                        languageProvider.isEnglish
                            ? "My orders"
                            : 'Mes commandes',
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
                    title: Text(
                        languageProvider.isEnglish ? "Event" : "Evenement",
                        style: const TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/images/whatsApp.png"),
                      color: Colors.grey[800],
                    ),
                    title: Text(
                      languageProvider.isEnglish
                          ? "Contacts us"
                          : 'Nous contactez',
                      style: const TextStyle(fontSize: 17),
                    ),
                    onTap: () {
                      try {
                        _openWhatsAppChat("+233591053549");
                      } catch (e) {
                        print("Error opening WhatsApp: $e");
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.share, size: 20),
                    title:
                        const Text('Share App', style: TextStyle(fontSize: 17)),
                    onTap: () async => await Share.share(
                        "Check out the amazing Food Delivery App. "
                        "https://play.google.com/store/apps/details?id=com.drivncustomer.drivn_customer."),
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
            GestureDetector(
              onTap: () async => await AuthApiService.logOut()
                  .then((value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPRequestView(),
                      ),
                      (route) => false)),
              child: Row(
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
                    languageProvider.isEnglish ? "LogOut" : "Déconnection",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
