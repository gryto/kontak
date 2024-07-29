// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import '../../src/api.dart';
// import '../../src/loader.dart';
// import '../../src/preference.dart';
// import '../../src/toast.dart';
// import 'component/list.dart';

// class Contactpage extends StatefulWidget {
//   const Contactpage({super.key});

//   @override
//   State<Contactpage> createState() => _ContactpageState();
// }

// class _ContactpageState extends State<Contactpage> {
//   SharedPref sharedPref = SharedPref();
//   bool isProcess = false;
//   int pageIndex = 0;
//   String fullName = "";
//   String division = "";
//   String typeUser = "";
//   String path = "";
//   String accessToken = "";
//   String dateString = "";
//   late final Function(int) callback;
//   String message = "";
//   List<Map<String, dynamic>> listData = [];
//   List listDataKontak = [];
//   List listDataHistoryMonth = [];
//   List listDataHistoryWeek = [];
//   List listDataHistoryDay = [];
//   String messagess = "";
//   String? id = '';

//   @override
//   void initState() {
//     getDataKontak();
//     super.initState();
//   }

//   getDataKontak() async {
//     try {
//       var accessToken = await sharedPref.getPref("access_token");

//       print("accestoke");
//       print(accessToken);
//       var url = ApiService.listContact;
//       var uri = url;
//       var bearerToken = 'Bearer $accessToken';
//       var response = await http.get(Uri.parse(uri),
//           headers: {"Authorization": bearerToken.toString()});
//       print("kontak");
//       print(url);
//       print(bearerToken);
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         setState(() {
//           var content = json.decode(response.body);
//           print("getdatauser");
//           print(content);

//           for (int i = 0; i < content['data'].length; i++) {
//             listDataKontak.add(content['data'][i]);
//           }
//           print("listkontak");
//           print(listDataKontak);
//         });
//       } else {
//         toastShort(context, message);
//       }
//     } catch (e) {
//       toastShort(context, e.toString());
//     }

//     setState(() {
//       isProcess = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return !isProcess
//         ? ContactList(
//             data: listData,
//           )
//         : loaderDialog(context);
//   }
// }
