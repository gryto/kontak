import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../../src/api.dart';
import '../../../widgets/notification_widget.dart';
import 'detail.dart';

class ContactList extends StatefulWidget {
  final data;
  const ContactList({super.key, required this.data});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            padding:
                const EdgeInsets.only(bottom: 5, top: 5, left: 5.0, right: 5.0),
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              var reversedIndex =
                  widget.data.length - 1 - index; // Menghitung indeks terbalik
              var row = widget.data[index];
              print("sosid");
              var photo = row['image'];

              var img = "";
              var avatar = row['foto'] ?? "";
              if (avatar != "" && avatar != null) {
                img = '${ApiService.folder}/$avatar';
              } else if (avatar != null) {
                img = ApiService.imgDefault;
              } else {
                img = ApiService.imgDefault;
              }

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ContactDetail(
                            contactName: row['nama'] ?? "",
                            contactEmail: row['email'] ?? "",
                            contactTlp: row['no_telpon'] ?? "",
                            contactAddress: row['alamat'] ?? "",
                            contactWilayah: row['wilayah_oprasi'] ?? "",
                            contactSpesialisai: row['spesialisasi'] ?? "",
                            contactStatus: row['status_agen'] ?? "",
                            contactOrganisasi: row['organisasi'] ?? "",
                            contactPhoto: row['foto'] ?? ""
                            ),
                    ),
                  );
                },
                child: NotificationCardWidget(
                  image: img,
                  isOnline: false,
                  message: row['nama'] ?? "",
                  // unReadCount: messageHistory,
                  count: '2',
                  // isUnReadCountShow: true,
                  time: row['no_telpon'] ?? "",
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
              height: 5,
            ),
            itemCount: widget.data.isEmpty ? 0 : widget.data.length,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_clock,
                  size: 90.0,
                  color: Colors.grey.shade400,
                ),
                Text(
                  "Ooops, Belum Ada User Dalam List Chat Anda!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      );
    }
  }
  
}

