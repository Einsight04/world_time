import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    // print formatted date
    String formattedDate = DateFormat.yMMMd().format(DateTime.now());
    print(formattedDate);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "/location");
            },
            icon: const Icon(Icons.edit_location),
            label: Text(formattedDate),
          ),
        ],
      )),
    );
  }
}
