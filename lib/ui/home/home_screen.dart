import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String data = "";

class _HomeScreenState extends State<HomeScreen> {
  final value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: const Text("QR CODE GENERATOR")),
        body: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Center(
              child: QrImage(
            size: 300,
            data: data,
            backgroundColor: Colors.white,
            version: QrVersions.auto,
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: size.width,
                // margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        data = value;
                      });
                    },
                    controller: value,
                    decoration: const InputDecoration(
                        hintText: "Type Here To Generate",
                        border: InputBorder.none),
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  data = "";
                  value.clear();
                });
              },
              child: const Text("Generate New QR"))
        ]),
      ),
    );
  }
}
