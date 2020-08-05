import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_store.dart';

class Components {
  static Future alert(context, title, content) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              child: Text(content),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

  static Future alertFinished(context, title, content) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              child: Text(content),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }


  static Future startHabit({context, title, content, negative, positive, idCat}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              child: Text(content),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  child: Text(negative)),
              FlatButton(
                  onPressed: () {
                    Modular.get<CategoriesStore>().chooseCategory(idCat);
                  },
                  child: Text(positive)),
            ],
          );
        });
  }

  static onLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

}
