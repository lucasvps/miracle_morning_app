import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/core/widgets.dart/components.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_page.dart';
import 'categories_controller.dart';
import 'package:intl/intl.dart';

class CategoriesPage extends StatefulWidget {
  final String title;
  const CategoriesPage({Key key, this.title = "Categories"}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState
    extends ModularState<CategoriesPage, CategoriesController> {
  //use 'controller' variable to access controller

  var finalDate = formatDate(
      DateFormat("yyyy-MM-dd")
          .parse(DateTime.now().add(Duration(days: 30)).toString()),
      [dd, '/', mm, '/', yyyy]).toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: controller.store.repository.getCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.none:
                return Text('Sem conexão, tenta novamente mais tarde!');
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Ocorreu um erro, recarregue a página!'));
                }
                if (!snapshot.hasData) {
                  return Center(
                      child: Text(
                    'Ocorreu um erro!',
                    style: TextStyle(fontSize: 20),
                  ));
                } else {
                  if (snapshot.data.toString() == '[]') {
                    return Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          AspectRatio(
                              aspectRatio: 1.2,
                              child: SvgPicture.asset(
                                  'lib/app/assets/svg/void.svg')),
                          Center(
                              child: Text(
                            'Você já esta realizando o desafio de todos os hábitos! Mantenha o foco!',
                            style: GoogleFonts.yanoneKaffeesatz(fontSize: 30, color: Colors.black),
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
                            color: AppThemeLight().getTheme().cardTheme.color.withOpacity(0.9),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 16, 16, 16),
                                        child: Text(
                                          list[index].name,
                                          style: GoogleFonts.patrickHand(
                                              fontSize: 24),
                                        ),
                                      ),
                                      Center(
                                        child: !controller.store.repository.idsChosen.contains(list[index].id) ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: RaisedButton(
                                            color: Colors.yellow,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(50))),
                                            onPressed: () {
                                              Components.startHabit(
                                                  idCat: list[index].id,
                                                  title: "Uhuuuuuu!!!",
                                                  content:
                                                      "É muito bom ver que você está se desafiando a mais um hábito do Milagre da Manhã! Serão 30 dias que irão mudar sua vida!\n\n A data final será $finalDate.",
                                                  context: context,
                                                  negative: "Cancelar",
                                                  positive: "Iniciar");
                                            },
                                            child: Text(
                                              'Iniciar Hábito',
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ) : SizedBox(),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(8.0),
                                          child: RaisedButton(
                                            color: AppThemeLight()
                                                .getTheme()
                                                .primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(50))),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoryDetailPage(
                                                            model:
                                                                list[index])),
                                              );
                                            },
                                            child: Text(
                                              'Ver sobre',
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Hero(
                                    tag: list[index].image,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: AspectRatio(
                                        aspectRatio: 1.15,
                                        child: SvgPicture.asset(
                                          list[index].image,
                                        ),
                                      ),
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
