import 'package:date_format/date_format.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'category_chosen_controller.dart';
import 'package:intl/intl.dart';

class CategoryChosenPage extends StatefulWidget {
  final String title;
  const CategoryChosenPage({Key key, this.title = "CategoryChosen"})
      : super(key: key);

  @override
  _CategoryChosenPageState createState() => _CategoryChosenPageState();
}

class _CategoryChosenPageState
    extends ModularState<CategoryChosenPage, CategoryChosenController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: controller.store.repository.getCategoriesChosenActive(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.none:
                return Text('erro 1');
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Ocorreu um erro, recarregue a página!'));
                }
                if (!snapshot.hasData) {
                  return Center(
                      child: Text(
                    'Você não possui registros anteriores!',
                    style: TextStyle(fontSize: 20),
                  ));
                } else {
                  if (snapshot.data.toString() == '[]') {
                    return Center(
                        child: Text(
                      'Você não possui registros anteriores!',
                      style: TextStyle(fontSize: 20),
                    ));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var list = snapshot.data;
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            shadowColor: AppThemeLight().getTheme().accentColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 5, 16, 2),
                                        child: Text(
                                          "Início : " +
                                              formatDate(
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(
                                                        list[index].beginDate,
                                                      ),
                                                      [dd, '/', mm, '/', yyyy])
                                                  .toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 2, 16, 8),
                                        child: Text(
                                          "Final : " +
                                              formatDate(
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(
                                                        list[index].endDate,
                                                      ),
                                                      [dd, '/', mm, '/', yyyy])
                                                  .toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 0, 16, 2),
                                        child: Text(
                                          'Dias realizados : ' +
                                              list[index].amountDone.toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Center(
                                        child: !controller.store.idDoneToday
                                                .contains(list[index].id)
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        24, 32, 16, 2),
                                                child: Text(
                                                  formatDate(
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(DateTime.now()
                                                              .toString()),
                                                      [
                                                        dd,
                                                        '/',
                                                        mm,
                                                        '/',
                                                        yyyy
                                                      ]).toString(),
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text('Te vejo amanhã!'),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    EvaIcons.sun,
                                                    color: Colors.deepOrange,
                                                  )
                                                ],
                                              ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: !controller.store.idDoneToday
                                                  .contains(list[index].id)
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.store.markAsDone(
                                                            list[index].id,
                                                            formatDate(
                                                                DateFormat("yyyy-MM-dd").parse(DateTime
                                                                        .now()
                                                                    .toString()),
                                                                [
                                                                  yyyy,
                                                                  '/',
                                                                  mm,
                                                                  '/',
                                                                  dd
                                                                ]).toString(),
                                                            1);
                                                      },
                                                      child: Icon(
                                                        EvaIcons
                                                            .checkmarkCircle2Outline,
                                                        color: AppThemeLight()
                                                            .getTheme()
                                                            .primaryColor,
                                                        size: 64,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.store.markAsDone(
                                                            list[index].id,
                                                            formatDate(
                                                                DateFormat("yyyy-MM-dd").parse(DateTime
                                                                        .now()
                                                                    .toString()),
                                                                [
                                                                  yyyy,
                                                                  '/',
                                                                  mm,
                                                                  '/',
                                                                  dd
                                                                ]).toString(),
                                                            0);
                                                      },
                                                      child: Icon(
                                                          EvaIcons
                                                              .closeCircleOutline,
                                                          color: Colors.red,
                                                          size: 64),
                                                    )
                                                  ],
                                                )
                                              : SizedBox(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Hero(
                                    tag: list[index].image,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: AspectRatio(
                                            aspectRatio: 1.15,
                                            child: SvgPicture.asset(
                                              list[index].image,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 5, 16, 10),
                                          child: Text(
                                            list[index].name,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }

                break;
            }
            return Container();
          }),
    );
  }
}
