import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/ui/views/login%20and%20signup/login_page.dart';
import 'package:stacked/stacked.dart';

import '../main/main_view.dart';
import 'login_view_model.dart';

class SignupPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/pexels-adrien-olichon-3709369.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Color.fromARGB(255, 15, 19, 24).withOpacity(0.6),
                          Color.fromARGB(255, 15, 19, 24),
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Center(
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Welcome!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: nameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  filled: true,
                                  //fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: emailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  filled: true,
                                  //fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: phoneController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Phone",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  filled: true,
                                  //fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            // Container(
                            //   height: 50,
                            //   margin: EdgeInsets.only(left: 40, right: 40),
                            //   child: TextFormField(
                            //     validator: (val) {
                            //       if (val!.isEmpty) {
                            //         return "Required";
                            //       }
                            //     },
                            //     style: TextStyle(
                            //         fontSize: 15, color: Colors.white),
                            //     decoration: InputDecoration(
                            //       hintText: "Gener",
                            //       hintStyle:
                            //           TextStyle(color: Colors.grey.shade700),
                            //       filled: true,
                            //       //fillColor: Color(0xff161d27).withOpacity(0.9),
                            //       enabledBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(30),
                            //           borderSide:
                            //               BorderSide(color: Colors.amber)),
                            //       focusedBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(30),
                            //           borderSide:
                            //               BorderSide(color: Colors.amber)),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 12,
                            // ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: passwordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Required";
                                  }
                                  if (val.length < 6) {
                                    return "Password must be atleast 6 characters long";
                                  }
                                  if (val.length > 20) {
                                    return "Password must be less than 20 characters";
                                  }
                                  if (!val.contains(RegExp(r'[0-9]'))) {
                                    return "Password must contain a number";
                                  }
                                },
                                obscureText: true,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  filled: true,
                                  //  fillColor: Color(0xff161d27).withOpacity(0.9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    await model.signup(
                                        emailController.text,
                                        passwordController.text,
                                        phoneController.text,
                                        nameController.text);

                                    if (model.isRegistered == 'logged in') {
                                      await model.getUser();
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerMainView()),
                                      );
                                    } else {
                                      await Fluttertoast.showToast(
                                          msg: '${model.isRegistered}',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "You already have an account?",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  }),
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
