import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_page.dart';
import 'chosen_done_controller.dart';
import 'package:intl/intl.dart';

class ChosenDonePage extends StatefulWidget {
  final String title;
  const ChosenDonePage({Key key, this.title = "ChosenDone"}) : super(key: key);

  @override
  _ChosenDonePageState createState() => _ChosenDonePageState();
}

class _ChosenDonePageState
    extends ModularState<ChosenDonePage, ChosenDoneController> {
  //use 'controller' variable to access controller

  var today = formatDate(
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()),
      [yyyy, '-', mm, '-', dd]).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffb9d7d9),
        appBar: AppBar(
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          title: Text('Seu histórico de Hábitos'),
          centerTitle: true,
        ),
        body: Container(
          child: FutureBuilder(
              future: controller.store.repository.getCategoriesChosenDone(),
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
                                'Você ainda não finalizou nenhum desafio de 30 dias. Mantenha o foco!',
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
                                shadowColor:
                                    AppThemeLight().getTheme().accentColor,
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                                                                    model: list[
                                                                        index],
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
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: AspectRatio(
                                                aspectRatio: 1.85,
                                                child: SvgPicture.asset(
                                                  list[index].image,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      24, 5, 16, 10),
                                              child: Center(
                                                child: Text(
                                                  list[index].name,
                                                  style:
                                                      GoogleFonts.patrickHand(
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
        ));
  }
}
