import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../src/api.dart';
import '../../../src/constant.dart';

// ignore: must_be_immutable
class ContactDetail extends StatelessWidget {
  String contactName,
      contactEmail,
      contactTlp,
      contactAddress,
      contactWilayah,
      contactSpesialisai,
      contactStatus,
      contactOrganisasi,
      contactPhoto;
  ContactDetail(
      {super.key,
      required this.contactName,
      required this.contactEmail,
      required this.contactTlp,
      required this.contactAddress,
      required this.contactWilayah,
      required this.contactSpesialisai,
      required this.contactStatus,
      required this.contactOrganisasi,
      required this.contactPhoto});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width - 0;

    String formatDate(String dateTimeString) {
      DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'");
      DateFormat outputFormat = DateFormat("dd-MM-yyyy");
      DateTime dateTime = inputFormat.parse(dateTimeString);
      String formattedDate = outputFormat.format(dateTime);
      return formattedDate;
    }

    double h = MediaQuery.of(context).size.height - 20;
    var mediaQueryHeight = MediaQuery.of(context).size.height;

        String url = "";

    _launchCaller() async {
      url = "tel:$contactTlp";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: clrPrimary,
        title: const Text("Detail",
            style: TextStyle(
              color: Colors.white,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      // width: 50,
                      height: mediaQueryHeight / 7,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            // radius: 15,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                // ignore: prefer_interpolation_to_compose_strings
                                '${ApiService.folder}/' + contactPhoto,
                                scale: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: const Text(
                        "Pengguna",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactName,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.text_fields),
                      title: const Text(
                        "Keterangan",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactEmail,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.wifi),
                      title: const Text(
                        "Alamat IP",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactAddress,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.mobile_friendly),
                      title: const Text(
                        "Browser",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactSpesialisai,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.laptop),
                      title: const Text(
                        "Sistem Operasi",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactOrganisasi,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.create),
                      title: const Text(
                        "Dibuat",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactStatus,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.update),
                      title: const Text(
                        "Diubah",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactTlp,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.update),
                      title: const Text(
                        "Diubah",
                        style: TextStyle(fontSize: 12, height: 1.8),
                      ),
                      subtitle: Text(
                        contactWilayah,
                        style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: w,
                        height: h / 14.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: clrPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                             _launchCaller();
                          },
                          child: const Text(
                            "Call/Chat",
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
