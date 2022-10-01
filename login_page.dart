import 'package:flutter/material.dart';
import 'package:movieapp/ui/views/main/main_view.dart';
import 'package:movieapp/ui/views/movies_list/movies_list_view.dart';
import 'package:movieapp/ui/views/login%20and%20signup/signup_page.dart';
import 'package:stacked/stacked.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../router.gr.dart';
import '../startup/start_up_view_model.dart';
import 'login_view_model.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onModelReady: (model) async => await model.clear(),
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
                  InkWell(
                      onTap: (() {
                        model.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerMainView()),
                        );
                      }),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(25, 50, 0, 0),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 15, 19, 24),
                                fontStyle: FontStyle.normal),
                          ))),
                  Center(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
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
                          Text(
                            "Time to watch, let's Sign in",
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                          SizedBox(
                            height: 20,
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                                  await model.login(emailController.text,
                                      passwordController.text);

                                  if (model.isLoggedIn == 'logged in') {
                                    await model.getUser();
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomerMainView()),
                                    );
                                  } else {
                                    await Fluttertoast.showToast(
                                        msg: 'user not found',
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
                                "SIGN IN",
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
                                "It's your first time here?",
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
                                        builder: (context) => SignupPage()),
                                  );
                                }),
                                child: InkWell(
                                  onTap: null,
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                ],
              ),
            ));
  }
}
