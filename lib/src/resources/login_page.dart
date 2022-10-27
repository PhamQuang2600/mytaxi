import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mytaxi/src/bloc/login_bloc.dart';
import 'package:mytaxi/src/dialog/loading_dialog.dart';
import 'package:mytaxi/src/dialog/msg_dialog.dart';
import 'package:mytaxi/src/firebase/firebase_auth.dart';
import 'package:mytaxi/src/resources/signup_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();

  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

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
            height: 150,
          ),
          Image.asset("assets/bg2.jpg"),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Text(
              "Welcome back!",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Login to continue using iCab",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: StreamBuilder(
                stream: bloc.userStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _user,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        prefixIcon: Container(
                          height: 50,
                          child: Icon(Icons.email_outlined),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid))),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: StreamBuilder(
                stream: bloc.passStream,
                builder: (context, snapshot) {
                  return TextField(
                    obscureText: true,
                    controller: _pass,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        prefixIcon: Container(
                          height: 50,
                          child: Icon(Icons.password),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1))),
                  );
                }),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              child: Text(
                "forgot password?",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _onLoginClick,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New user? ",
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                },
                child: Text(
                  "Sign up for new account",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              )
            ],
          ))
        ],
      )),
    ));
  }

  void _onLoginClick() {
    if (bloc.isValid(_user.text, _pass.text)) {
      LoadingDiaLog.showLoadingDiaLog(context, "Loading...");
      bloc.logIn(_user.text, _pass.text, () {
        LoadingDiaLog.hideLoadingDiaLog(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }, (msg) {
        LoadingDiaLog.hideLoadingDiaLog(context);
        MsgDiaLog.showMessDiaLog(context, "Đăng nhập", msg);
      });
    }
  }
}
