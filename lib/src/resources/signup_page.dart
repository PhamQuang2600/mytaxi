import 'package:flutter/material.dart';
import 'package:mytaxi/src/bloc/signup_bloc.dart';
import 'package:mytaxi/src/dialog/loading_dialog.dart';
import 'package:mytaxi/src/dialog/msg_dialog.dart';
import 'package:mytaxi/src/firebase/firebase_auth.dart';
import 'package:mytaxi/src/resources/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpBloc bloc = new SignUpBloc();

  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 140,
            ),
            Image.asset("assets/bg2.jpg"),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 5),
              child: Text(
                "Welcome Aboard!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Signup with iCab in simple steps",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: StreamBuilder(
                    stream: bloc.nameStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _name,
                        decoration: InputDecoration(
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            prefixIcon: Container(
                              height: 50,
                              child: Icon(Icons.person_outlined),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10))),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: StreamBuilder(
                    stream: bloc.phoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _phone,
                        decoration: InputDecoration(
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            prefixIcon: Container(
                              height: 50,
                              child: Icon(Icons.phone_outlined),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10))),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: StreamBuilder(
                    stream: bloc.userStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _user,
                        decoration: InputDecoration(
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            prefixIcon: Container(
                              height: 50,
                              child: Icon(Icons.email_outlined),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10))),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: StreamBuilder(
                    stream: bloc.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _pass,
                        obscureText: true,
                        decoration: InputDecoration(
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            prefixIcon: Container(
                              height: 50,
                              child: Icon(Icons.password),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10))),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _onSignUpClick,
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Already a User? ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                )
              ]),
            )
          ],
        )),
      ),
    );
  }

  void _onSignUpClick() {
    if (bloc.isValid(_user.text, _pass.text, _name.text, _phone.text)) {
      LoadingDiaLog.showLoadingDiaLog(context, "Loading...");
      bloc.signUp(_user.text, _name.text, _pass.text, _phone.text, () {
        LoadingDiaLog.hideLoadingDiaLog(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      }, (msg) {
        LoadingDiaLog.hideLoadingDiaLog(context);
        MsgDiaLog.showMessDiaLog(context, "Đăng kí", msg);
      });
    }
  }
}
