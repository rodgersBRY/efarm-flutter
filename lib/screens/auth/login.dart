import 'package:efarm/controllers/user.controller.dart';
import 'package:efarm/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController _userController = Get.find();

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  bool obscureText = true;

  Future _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Warning",
        "Your email or password cannot be empty",
        icon: Icon(Icons.warning, color: Colors.white),
        backgroundColor: AppColors.errorColor,
        colorText: Colors.white,
      );

      return;
    }

    var statusCode = await _userController.loginUser(
      email: email.trim(),
      password: password.trim(),
    );

    if (statusCode == 200) {
      _emailController.clear();
      _passwordController.clear();
      Get.snackbar(
        "Success",
        "Logged in successfully",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_circle_outline, color: Colors.white),
      );

      Get.offNamed('/');
    } // email not found
    else if (statusCode == 404) {
      Get.snackbar(
        "Error",
        "No user with that email",
        icon: Icon(Icons.warning, color: Colors.white),
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } // wrong password
    else if (statusCode == 401) {
      Get.snackbar(
        "Error",
        "Password is incorrect",
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        icon: Icon(Icons.warning, color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _emailNode.unfocus();
        _passwordNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryGreenColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/logo.png",
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 40),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                focusNode: _emailNode,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.white70),
                  labelText: "Enter your email",
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                focusNode: _passwordNode,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  prefixIcon: Icon(Icons.key_rounded, color: Colors.white70),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white70),
                  ),
                  labelText: "Enter your password",
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Gap(40),
            GestureDetector(
              onTap: _login,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Obx(() => Center(
                          child: _userController.isLoading
                              ? CircularProgressIndicator(color: Colors.white70)
                              : Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
