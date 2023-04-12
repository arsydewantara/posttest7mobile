import 'package:flutter/material.dart';
import 'package:posttest7_033_arsy/landingPage.dart';
import 'package:posttest7_033_arsy/pubgPage.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FreeFirePage(),
      theme: ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
    );
  }
}

class FreeFirePage extends StatefulWidget {
  const FreeFirePage({super.key});

  @override
  State<FreeFirePage> createState() => _FreeFirePageState();
}

class _FreeFirePageState extends State<FreeFirePage> {
  final switchController2 n = Get.put(switchController2());
  late TextEditingController idController;
  late TextEditingController serverController;

  bool isSatu = false;
  bool isDua = false;
  bool inResultPage = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return inResultPage
        ? buildResultPage(context)
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "GameZone",
                style: TextStyle(color: Color.fromARGB(255, 20, 3, 78)),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Color.fromARGB(249, 223, 191, 9),
              flexibleSpace: Obx(() => Container(
                  color: n.switchValue.value
                      ? Color.fromARGB(255, 3, 216, 253)
                      : Colors.amber)),
              actions: [
                Obx(() => Switch(
                      value: n.switchValue.value,
                      onChanged: (newValue) {
                        n.switchValue(newValue);
                      },
                    )),
              ],
            ),
            drawer: Drawer(
              backgroundColor: Color.fromARGB(249, 223, 191, 9),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 3, 216, 253),
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'))),
                    child: Text(" "),
                  ),
                  ListTile(
                    title: Text("Free Fire"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (value) {
                        return FreeFirePage();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text("PUBG Mobile"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (value) {
                        return PUBGPage();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text("Mobile Legend"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (value) {
                        return LandingPage();
                      }));
                    },
                  )
                ],
              ),
            ),
            body: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                buildHeader(context),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "ID Akun",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    hintText: "Masukkan ID Akun",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        value: isSatu,
                        onChanged: (value) {
                          setState(() {
                            isSatu = !isSatu;
                          });
                        },
                      ),
                      title: Text("5 Diamond"),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: isDua,
                        onChanged: (value) {
                          setState(() {
                            isDua = !isDua;
                          });
                        },
                      ),
                      title: Text("12 Diamond"),
                    )
                  ],
                ),
              ],
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    serverController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    serverController.dispose();
  }

  Widget buildHeader(BuildContext context) {
    var width2 = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text("Free Fire"),
        Expanded(
          child: SizedBox(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            setState(() {
              idController.clear();
              serverController.clear();
              isSatu = false;
              isDua = false;
            });
          },
          child: Text("Reset"),
        ),
        SizedBox(
          width: 2,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {},
          child: Text("Cancel"),
        ),
        SizedBox(
          width: 2,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            setState(() {
              inResultPage = true;
            });
          },
          child: Text("Confirm"),
        ),
      ],
    );
  }

  Widget buildResultPage(BuildContext context) {
    var width2 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Profil"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Text("ID Akun : ${idController.text}"),
          SizedBox(
            width: width2,
          ),
          Text("Jumlah Diamond Yang dibeli : ${isSatu}"),
          SizedBox(
            width: width2,
          ),
          Text("Jumlah Diamond Yang dibeli : ${isDua}"),
          SizedBox(
            width: width2,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                inResultPage = false;
              });
            },
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }
}

class switchController2 extends GetxController {
  var switchValue = false.obs;
}
