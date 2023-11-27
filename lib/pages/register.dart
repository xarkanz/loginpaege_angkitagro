// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:register_form/pages/login.dart';
import 'package:register_form/util/register_tile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _deviceId;

  @override
  void initState() {
    super.initState();
    _deviceId = 'Loading...';
    _fetchDeviceId();
  }

  Future<void> _fetchDeviceId() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
        setState(() {
          _deviceId = androidInfo.id;
        });
      } else {
        setState(() {
          _deviceId = 'Device ID not available on this platform.';
        });
      }
    } catch (e) {
      setState(() {
        _deviceId = 'Failed to retrieve device ID.';
      });
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: screenHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          width: 180,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 200, 200, 200)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 30, 8, 10),
                            child: Column(
                              children: [
                                Text(
                                  "Register",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 42, 42, 42),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RegisterTile(
                                          editingController: usernameController,
                                          labelText: "Username",
                                          textType: false,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        RegisterTile(
                                          editingController: emailController,
                                          labelText: "Email",
                                          textType: false,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        RegisterTile(
                                          editingController: passwordController,
                                          labelText: "Password",
                                          textType: true,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        MaterialButton(
                                          minWidth: double.infinity,
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          },
                                          child: Text(
                                            "Register",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          color:
                                              Color.fromRGBO(102, 179, 87, 1),
                                          elevation: 0,
                                          highlightElevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          padding:
                                              EdgeInsets.fromLTRB(0, 15, 0, 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Device ID: $_deviceId",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
