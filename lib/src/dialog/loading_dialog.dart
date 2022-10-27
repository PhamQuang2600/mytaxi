import 'package:flutter/material.dart';

class LoadingDiaLog {
  static void showLoadingDiaLog(BuildContext context, String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Dialog(
              child: Container(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          msg,
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ]),
              ),
            ));
  }

  static void hideLoadingDiaLog(BuildContext context) {
    Navigator.of(context).pop(LoadingDiaLog);
  }
}
