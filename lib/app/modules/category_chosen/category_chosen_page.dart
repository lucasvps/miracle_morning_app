import 'package:date_format/date_format.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/core/widgets.dart/components.dart';
import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_page.dart';
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

  var today = formatDate(
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()),
      [yyyy, '-', mm, '-', dd]).toString();

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
                  print(snapshot.error);
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
                    return Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          AspectRatio(
                              aspectRatio: 1.5,
                              child: SvgPicture.asset(
                                  'lib/app/assets/svg/void.svg')),
                          Center(
                              child: Text(
                            'Você não está fazendo nenhum desafio! Vamos lá!',
                            style: TextStyle(fontSize: 25),
                          )),
                        ],
                      ),
                    );
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
                            color: Colors.white.withOpacity(0.9),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 5, 16, 2),
                                          child: Text(
                                            "Início : " +
                                                formatDate(
                                                    DateFormat("yyyy-MM-dd")
                                                        .parse(
                                                      list[index].beginDate,
                                                    ),
                                                    [
                                                      dd,
                                                      '/',
                                                      mm,
                                                      '/',
                                                      yyyy
                                                    ]).toString(),
                                            style: GoogleFonts.patrickHand(
                                                fontSize: 22),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 2, 16, 8),
                                          child: Text(
                                            "Final : " +
                                                formatDate(
                                                    DateFormat("yyyy-MM-dd")
                                                        .parse(
                                                      list[index].endDate,
                                                    ),
                                                    [
                                                      dd,
                                                      '/',
                                                      mm,
                                                      '/',
                                                      yyyy
                                                    ]).toString(),
                                            style: GoogleFonts.patrickHand(
                                                fontSize: 22),
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
                                                            .parse(DateTime
                                                                    .now()
                                                                .toString()),
                                                        [
                                                          dd,
                                                          '/',
                                                          mm,
                                                          '/',
                                                          yyyy
                                                        ]).toString(),
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Expanded(
                                                          flex: 0,
                                                          child: Text(
                                                            'Te vejo amanhã!',
                                                            style: GoogleFonts
                                                                .yanoneKaffeesatz(
                                                                    fontSize:
                                                                        22),
                                                          )),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Icon(
                                                          EvaIcons.sun,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 45,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child:
                                                !controller.store.idDoneToday
                                                        .contains(
                                                            list[index].id)
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller.store.markAsDone(
                                                                      list[index]
                                                                          .id,
                                                                      formatDate(
                                                                          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()), [
                                                                        yyyy,
                                                                        '-',
                                                                        mm,
                                                                        '-',
                                                                        dd
                                                                      ]).toString(),
                                                                      true);

                                                                  Future.delayed(Duration(
                                                                          seconds:
                                                                              1))
                                                                      .then(
                                                                          (value) {
                                                                    if (today ==
                                                                        list[index]
                                                                            .endDate) {
                                                                      Components.alert(
                                                                          context,
                                                                          'PARABÉNS!',
                                                                          "Hoje foi o último dia do seu desafio de ${list[index].name}! Espero que tenha sido uma jornada valiosa, e espero te ver mais vezes aqui!");
                                                                    }
                                                                  });
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
                                                              Text(
                                                                'Fez hoje',
                                                                style: GoogleFonts
                                                                    .yanoneKaffeesatz(
                                                                        fontSize:
                                                                            16),
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller.store.markAsDone(
                                                                      list[index]
                                                                          .id,
                                                                      formatDate(
                                                                          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()), [
                                                                        yyyy,
                                                                        '-',
                                                                        mm,
                                                                        '-',
                                                                        dd
                                                                      ]).toString(),
                                                                      false);

                                                                  Future.delayed(Duration(
                                                                          seconds:
                                                                              1))
                                                                      .then(
                                                                          (value) {
                                                                    if (today ==
                                                                        list[index]
                                                                            .endDate) {
                                                                      Components.alert(
                                                                          context,
                                                                          'PARABÉNS!',
                                                                          "Hoje foi o último dia do seu desafio de ${list[index].name}! Espero que tenha sido uma jornada valiosa, e espero te ver mais vezes aqui!");
                                                                    }
                                                                  });
                                                                },
                                                                child: Icon(
                                                                    EvaIcons
                                                                        .closeCircleOutline,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 64),
                                                              ),
                                                              Text(
                                                                'Não fez hoje',
                                                                style: GoogleFonts
                                                                    .yanoneKaffeesatz(
                                                                        fontSize:
                                                                            16),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    : SizedBox(),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: RaisedButton(
                                                color: Colors.yellow,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50))),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ChosenDetailsPage(
                                                                model:
                                                                    list[index],
                                                              )));
                                                },
                                                child: Text(
                                                  'Ver Detalhes',
                                                  style: GoogleFonts.lato(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
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
                                          child: Center(
                                            child: Text(
                                              list[index].name,
                                              style: GoogleFonts.patrickHand(
                                                  fontSize: 24),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
