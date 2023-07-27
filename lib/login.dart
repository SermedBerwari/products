import 'package:flutter/material.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/main.dart';
import 'package:my_first_app/service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                child: Column(children: [
                  headerMethod(size),
                  const SizedBox(
                    height: 30,
                  ),
                  textfieldMethod(username, "User Name"),
                  textfieldMethod(password, "Password"),
                  ElevatedButton(
                      onPressed: () {
                        final result =
                            ServeceApi().login(username.text, password.text);
                        showMessage(result['status'], context);
                        if (result['status'] == "Logined Succefully") {
                          prefs!.setBool("isLogined", true);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                      },
                      child: const Text('Login'))
                ]),
              ),
              Positioned(
                  top: size.height - 180,
                  left: -80,
                  child: Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(180)),
                  )),
              Positioned(
                  top: size.height - 300,
                  left: size.width - 250,
                  child: Transform.rotate(
                    angle: 60,
                    child: Container(
                      width: 460,
                      height: 460,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 46, 36, 0.3),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  showMessage(message, context) {
    Color bckColor = Colors.green;
    if (message != "Logined Succefully") {
      bckColor = Colors.red;
    }
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: bckColor,
      content: Text(message),
      duration: const Duration(milliseconds: 3000),
    ));
  }

  Padding textfieldMethod(myController, text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 15),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
            hintText: text,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.red),
                borderRadius: BorderRadius.circular(35)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 5, color: Colors.blue),
                borderRadius: BorderRadius.circular(35))),
      ),
    );
  }

  Container headerMethod(Size size) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: 0.25 * size.height,
      color: Colors.indigo,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.indigo[300], borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.person,
          size: 80,
          color: Color.fromARGB(255, 7, 1, 1),
        ),
      ),
    );
  }
}
