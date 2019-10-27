import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProgressTestPage extends StatefulWidget {
  @override
  _ProgressTestPageState createState() => _ProgressTestPageState();
}

class _ProgressTestPageState extends State<ProgressTestPage> {
  ProgressDialog loadingDialog;
  bool _toggleColor = false;

  Widget build(BuildContext context) {
    loadingDialog = ProgressDialog(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: _toggleColor ? Colors.grey[900] : Colors.grey[50]),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50), child: TextFormField()),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "btn",
                  onPressed: () async {
                    SchedulerBinding.instance.addPostFrameCallback((_) async {
                      if (!loadingDialog.isShowing()) loadingDialog.show();
                      await Future.delayed(Duration(seconds: 5));
                      print("loading dialog 1: ${loadingDialog.toString()}");
                      if (loadingDialog.isShowing()) loadingDialog.update(message: "almost done");
                      await Future.delayed(Duration(seconds: 2));
                      //FIXME: calling inheritFromWidgetOfExactType() in the widget's didChangeDependencies() method
                      if (loadingDialog.isShowing()) loadingDialog.hide();
                    });
                  },
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.update,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    setState(() {
                      _toggleColor = !_toggleColor;
                    });
                  },
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.bubble_chart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
